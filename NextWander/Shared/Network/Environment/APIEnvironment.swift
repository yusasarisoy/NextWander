//
//  APIEnvironment.swift
//  NextWander
//
//  Created by Yusa Sarisoy on 08.08.25.
//

import Foundation

// MARK: - APIEnvironment
public struct APIEnvironment {
    public let baseURL: URL
    public let defaultHeaders: [String: String]

    public init(baseURL: URL, defaultHeaders: [String: String] = [:]) {
        self.baseURL = baseURL
        self.defaultHeaders = defaultHeaders
    }

    // MARK: - Presets
    public static let placeholder = APIEnvironment(
        baseURL: URL(string: "https://api.nextwander.local")!,
        defaultHeaders: ["Content-Type": "application/json"]
    )
}
