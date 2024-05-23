//
//  MapperHomeCryptoCoin.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation

struct MapperHomeCryptoCoin {
    func map(entity: HomeCryptoCoinEntity) -> HomeCryptoCoinViewModel{
        return HomeCryptoCoinViewModel(title: entity.coinInfo.fullName, subtitle: entity.coinInfo.name, imageURL: URL(string: ApiUtils.originUrl + entity.coinInfo.imageUrl), price: entity.display?.eur.price ?? "")
    }
}
