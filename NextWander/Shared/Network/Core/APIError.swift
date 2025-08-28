//
//  APIError.swift
//  NextWander
//
//  Created by Yusa Sarisoy on 08.08.25.
//

import Foundation

enum APIError: Error, LocalizedError {
    case invalidURL
    case transport(Error)
    case noResponse
    case serverStatus(Int, Data?)
    case decoding(Error)
    case cancelled
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .transport(let err):
            return err.localizedDescription
        case .noResponse:
            return "No response from server."
        case .serverStatus(let code, _):
            return "Server error (\(code))."
        case .decoding:
            return "Failed to decode response."
        case .cancelled:
            return "Request was cancelled."
        case .unknown:
            return "Unknown error."
        }
    }
}
