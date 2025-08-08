//
//  Endpoint.swift
//  NextWander
//
//  Created by Yusa Sarisoy on 08.08.25.
//

import Foundation

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String] { get }
    var query: [URLQueryItem] { get }
    var body: Data? { get }
    var timeout: TimeInterval { get }
}

extension Endpoint {
    var headers: [String: String] { [:] }
    var query: [URLQueryItem] { [] }
    var body: Data? { nil }
    var timeout: TimeInterval { 30 }
}
