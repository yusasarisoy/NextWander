//
//  RetryPolicy.swift
//  NextWander
//
//  Created by Yusa Sarisoy on 08.08.25.
//

import Foundation

protocol RetryPolicy {
    func shouldRetry(error: Error, attempt: Int, response: URLResponse?) -> Bool
    func delay(for attempt: Int) -> UInt64
}

struct ExponentialBackoffRetryPolicy: RetryPolicy {
    private let maxAttempts: Int
    private let baseDelay: UInt64
    
    init(maxAttempts: Int = 3, baseDelayMilliseconds: Int = 300) {
        self.maxAttempts = maxAttempts
        self.baseDelay = UInt64(baseDelayMilliseconds) * 1_000_000
    }
    
    func shouldRetry(error: Error, attempt: Int, response: URLResponse?) -> Bool {
        guard attempt < maxAttempts else { return false }
        if let http = response as? HTTPURLResponse {
            return (500...599).contains(http.statusCode)
        }
        if case APIError.transport = error { return true }
        return false
    }
    
    func delay(for attempt: Int) -> UInt64 {
        baseDelay << (attempt - 1)
    }
}
