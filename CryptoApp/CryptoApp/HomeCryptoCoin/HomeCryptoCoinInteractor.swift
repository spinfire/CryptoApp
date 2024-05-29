//
//  HomeCryptoCoinInteractor.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation
protocol HomeCryptoCoinInteractable {
    func getCryptoCoinList(page: Int) async -> HomeCryptoCoinResponseEntity
}
class HomeCryptoCoinInteractor: HomeCryptoCoinInteractable{
    private let apiManager: ApiManagerProtocol
    init(apiManager: ApiManagerProtocol) {
        self.apiManager = apiManager
    }
    func getCryptoCoinList(page: Int) async -> HomeCryptoCoinResponseEntity{
        return await apiManager.getCryptoCoinList(page: page)
    }
}

class HomeCryptoCoinInteractorMock: HomeCryptoCoinInteractable{
    func getCryptoCoinList(page: Int) async -> HomeCryptoCoinResponseEntity{
        return HomeCryptoCoinResponseEntity(data: [
            .init(coinInfo: 
                    .init(id: "", name: "", fullName: "", imageUrl: ""), display: .init(eur: .init(price: "", volume24Hour: ""))
            )
        ], metadata: .init(count: page))
    }

}
