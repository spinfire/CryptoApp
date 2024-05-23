//
//  HomeCryptoCoinEntity.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation

struct HomeCryptoCoinEntity: Decodable {
    var coinInfo: CoinInfo
    var display: DisplayInfo?

    enum CodingKeys: String, CodingKey {
        case coinInfo = "CoinInfo"
        case display = "DISPLAY"
    }
}

struct CoinInfo: Decodable {
    var id: String
    var name: String
    var fullName: String
    var imageUrl: String

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case fullName = "FullName"
        case imageUrl = "ImageUrl"
    }
}

struct DisplayInfo: Decodable {
    var eur: CurrencyDisplayInfo

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
    }
}

struct CurrencyDisplayInfo: Decodable {
    var price: String
    var volume24Hour: String

    enum CodingKeys: String, CodingKey {
        case price = "PRICE"
        case volume24Hour = "VOLUME24HOUR"
    }
}

