//
//  Data+DecodingJSON.swift
//  NextWander
//
//  Created by Yusa Sarisoy on 08.08.25.
//

import Foundation

// MARK: - Data+PrettyJSON
public extension Data {
    var prettyPrintedJSONString: String? {
        guard
            let obj = try? JSONSerialization.jsonObject(with: self),
            let data = try? JSONSerialization.data(withJSONObject: obj, options: [.prettyPrinted]),
            let str = String(data: data, encoding: .utf8)
        else { return nil }
        return str
    }
}
