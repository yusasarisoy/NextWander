//
//  LoggerInterceptor.swift
//  NextWander
//
//  Created by Yusa Sarisoy on 08.08.25.
//

import Foundation

struct LoggerInterceptor: RequestInterceptor {
    func willSend(_ request: URLRequest) {
        #if DEBUG
        print("➡️ [REQ] \(request.httpMethod ?? "") \(request.url?.absoluteString ?? "")")
        if let headers = request.allHTTPHeaderFields, !headers.isEmpty {
            print("   Headers: \(headers)")
        }
        if let body = request.httpBody, !body.isEmpty {
            print("   Body: \(String(data: body, encoding: .utf8) ?? "<binary>")")
        }
        #endif
    }

    func didReceive(_ result: Result<(Data, URLResponse), Error>, for request: URLRequest) {
        #if DEBUG
        switch result {
        case .success(let (data, response)):
            let status = (response as? HTTPURLResponse)?.statusCode ?? 0
            print("✅ [RES] \(status) bytes:\(data.count)")
        case .failure(let error):
            print("❌ [ERR] \(error.localizedDescription)")
        }
        #endif
    }
}
