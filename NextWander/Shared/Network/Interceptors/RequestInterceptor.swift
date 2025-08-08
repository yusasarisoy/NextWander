//
//  RequestInterceptor.swift
//  NextWander
//
//  Created by Yusa Sarisoy on 08.08.25.
//

import Foundation

protocol RequestInterceptor {
    func adapt(_ request: URLRequest) async -> URLRequest
    func willSend(_ request: URLRequest)
    func didReceive(_ result: Result<(Data, URLResponse), Error>, for request: URLRequest)
}

extension RequestInterceptor {
    func adapt(_ request: URLRequest) async -> URLRequest { request }
    func willSend(_ request: URLRequest) {}
    func didReceive(_ result: Result<(Data, URLResponse), Error>, for request: URLRequest) {}
}
