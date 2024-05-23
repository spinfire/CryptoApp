//
//  HomeCryptoCoinResponseEntity.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation
struct HomeCryptoCoinResponseEntity: Decodable{
    let data: [HomeCryptoCoinEntity]
    let metadata: HomeCryptoCoinMetadata
    enum CodingKeys: String, CodingKey {
        case data = "Data"
        case metadata = "MetaData"
    }
}

struct HomeCryptoCoinMetadata: Decodable{
    var count: Int
    enum CodingKeys: String, CodingKey {
        case count = "Count"
    }
}
