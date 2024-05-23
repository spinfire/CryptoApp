//
//  CryptoCoinPageInfo.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation

struct CryptoCoinPageInfo {
    let count: Int
    let pagination: Int
    let numberPages: Int
    
    init(count: Int, pagination: Int) {
        self.count = count
        self.pagination = pagination
        let pages = Double(count) / Double(pagination)
        self.numberPages = Int(ceil(pages))
    }
}
