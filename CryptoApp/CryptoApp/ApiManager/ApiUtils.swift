//
//  ApiUtils.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation
class ApiUtils {
    static let apiUrl: String = "https://min-api.cryptocompare.com/"
    static let originUrl: String = "https://www.cryptocompare.com"
    
    struct Endpoints {
        static let topTotalVolumeFull: String = "data/top/totalvolfull"
    }
    
    struct Parameters {
        static let limit: String = "limit"
        static let page: String = "page"
        static let tsym: String = "tsym"
    }
    
    struct ParameterValues {
        static let limitValue: String = "20"
        static let tsymValue: String = "EUR"
    }
    
    static func queryParameters(forPage page: Int) -> [String: Any] {
        return [
            Parameters.limit: ParameterValues.limitValue,
            Parameters.page: "\(page)",
            Parameters.tsym: ParameterValues.tsymValue
        ]
    }
}
