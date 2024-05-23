//
//  HTTPClientError.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case parsingError
    case tooManyRequests
    case badURL
    case responseError
    case generic
}
