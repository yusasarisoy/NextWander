//
//  APIClient.swift
//  NextWander
//
//  Created by Yusa Sarisoy on 08.08.25.
//

protocol APIClient {
    @discardableResult
    func send<Element: Decodable & Sendable>(
        _ endpoint: Endpoint,
        as type: Element.Type
    ) async throws -> Element

    func send(_ endpoint: Endpoint) async throws
}
