//
//  RequestBuilding.swift
//  NextWander
//
//  Created by Yusa Sarisoy on 08.08.25.
//

import Foundation

// MARK: - RequestBuilding
protocol RequestBuilding {
    func makeRequest(from endpoint: Endpoint) throws -> URLRequest
}

// MARK: - DefaultRequestBuilder
struct DefaultRequestBuilder: RequestBuilding {
    func makeRequest(from endpoint: Endpoint) throws -> URLRequest {
        var components = URLComponents(
            url: endpoint.baseURL.appendingPathComponent(endpoint.path),
            resolvingAgainstBaseURL: false
        )
        components?.queryItems = endpoint.query.isEmpty ? nil : endpoint.query
        
        guard let url = components?.url else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url, timeoutInterval: endpoint.timeout)
        request.httpMethod = endpoint.method.rawValue
        request.httpBody = endpoint.body
        endpoint.headers.forEach {
            request.setValue($0.value, forHTTPHeaderField: $0.key)
        }
        return request
    }
}
