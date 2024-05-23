//
//  MapperDetailCryptoCoin.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation

struct MapperDetailCryptoCoin {
    func map(entity: HomeCryptoCoinEntity) -> DetailCryptoCoinViewModel{        
        let entity: DetailCryptoCoinEntity = DetailCryptoCoinEntity(
            id: entity.coinInfo.id,
            name: entity.coinInfo.fullName,
            logoImage: ApiUtils.originUrl + entity.coinInfo.imageUrl,
            symbol: entity.coinInfo.name,
            value: entity.display?.eur.price ?? "",
            volume24h: entity.display?.eur.volume24Hour ?? "")
        return DetailCryptoCoinViewModel(crypto: entity)
    }
}
