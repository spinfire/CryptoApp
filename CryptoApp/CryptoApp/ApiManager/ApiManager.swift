//
//  ApiManager.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation

protocol ApiManagerProtocol {
    func getCryptoCoinList(page: Int) async -> HomeCryptoCoinResponseEntity
}

struct Endpoint {
    let path: String
    let queryParameters: [String : Any]
    let method: HTTPMethod
}

enum HTTPMethod {
    case get
    case post
}

class ApiManager: ApiManagerProtocol {
    func getCryptoCoinList(page: Int) async -> HomeCryptoCoinResponseEntity {
        let queryParameters = ApiUtils.queryParameters(forPage: page)
        let endpoint = Endpoint(path: ApiUtils.Endpoints.topTotalVolumeFull,
                                queryParameters: queryParameters,
                                method: .get)
        
        let url =  URL(string: "https://min-api.cryptocompare.com/data/top/totalvolfull?limit=20&page=0&tsym=EUR")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(HomeCryptoCoinResponseEntity.self, from: data)
        
    }
}
