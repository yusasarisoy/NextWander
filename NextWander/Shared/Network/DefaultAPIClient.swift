//
//  DefaultAPIClient.swift
//  NextWander
//
//  Created by Yusa Sarisoy on 08.08.25.
//

import Foundation

final class DefaultAPIClient: APIClient {
    
    // MARK: - Properties
    private let session: URLSession
    private let builder: RequestBuilding
    private let interceptors: [RequestInterceptor]
    private let retryPolicy: RetryPolicy
    private let decoder: JSONDecoder
    
    // MARK: - Init
    init(
        session: URLSession = .shared,
        builder: RequestBuilding = DefaultRequestBuilder(),
        interceptors: [RequestInterceptor] = [LoggerInterceptor()],
        retryPolicy: RetryPolicy = ExponentialBackoffRetryPolicy(),
        decoder: JSONDecoder = .app
    ) {
        self.session = session
        self.builder = builder
        self.interceptors = interceptors
        self.retryPolicy = retryPolicy
        self.decoder = decoder
    }
    
    // MARK: - APIClient
    func send<Element: Decodable & Sendable>(
        _ endpoint: Endpoint,
        as type: Element.Type
    ) async throws -> Element {
        let data = try await perform(endpoint)
        do { return try decoder.decode(Element.self, from: data) }
        catch { throw APIError.decoding(error) }
    }
    
    func send(_ endpoint: Endpoint) async throws {
        _ = try await perform(endpoint)
    }
    
    // MARK: - Private
    private func perform(_ endpoint: Endpoint) async throws -> Data {
        var request = try builder.makeRequest(from: endpoint)
        for interceptor in interceptors {
            request = await interceptor.adapt(request)
        }
        
        var attempt = 0
        while true {
            attempt += 1
            interceptors.forEach { $0.willSend(request) }
            
            do {
                let (data, response) = try await session.data(for: request)
                guard let http = response as? HTTPURLResponse,
                      (200...299).contains(http.statusCode) else {
                    let status = (response as? HTTPURLResponse)?.statusCode ?? 0
                    let error = APIError.serverStatus(status, data)
                    if retryPolicy.shouldRetry(error: error, attempt: attempt, response: response) {
                        try await Task.sleep(nanoseconds: retryPolicy.delay(for: attempt))
                        continue
                    }
                    interceptors.forEach { $0.didReceive(.failure(error), for: request) }
                    throw error
                }
                interceptors.forEach { $0.didReceive(.success((data, response)), for: request) }
                return data
            } catch {
                if (error as NSError).code == NSURLErrorCancelled {
                    throw APIError.cancelled
                }
                let wrapped = APIError.transport(error)
                if retryPolicy.shouldRetry(error: wrapped, attempt: attempt, response: nil) {
                    try await Task.sleep(nanoseconds: retryPolicy.delay(for: attempt))
                    continue
                }
                interceptors.forEach { $0.didReceive(.failure(wrapped), for: request) }
                throw wrapped
            }
        }
    }
}
