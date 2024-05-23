//
//  CryptoData.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 23/5/24.
//

import Foundation
import CoreData

struct CryptoCurrencyPaginationInfo {
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
//protocol LocalDataSourceType {
//    func getCryptoList(page: Int) async -> Result<(cryptoList: [CryptoCurrency], paginationInfo: CryptoCurrencyPaginationInfo), Error>
//    func saveCryptoList(_ cryptoList: [CryptoCurrency]) async
//}

class CryptoData {
    private var managedContext: NSManagedObjectContext
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
//    func saveCryptoData(page: Int) async ->Result<(entityList: [DetailCryptoCoinEntity], paginationInfo: CryptoCurrencyPaginationInfo), Error>{
//        let fetchRequest: NSFetchRequest<HomeCryptoCoinEntities> = HomeCryptoCoinEntities.fetchRequest()
//
//        do {
//            let results = try managedContext.fetch(fetchRequest)
//            let cryptoList = results.map { cryptoEntity -> DetailCryptoCoinEntity in
//                return DetailCryptoCoinEntity(
//                    id: cryptoEntity.id ?? "",
//                    name: cryptoEntity.name ?? "",
//                    logoImage: cryptoEntity.logoImage ?? "",
//                    symbol: cryptoEntity.symbol ?? "",
//                    value: cryptoEntity.value ?? "",
//                    volume24h: cryptoEntity.volume24h ?? ""
//                )
//            }
//            
//            let mockPaginationInfo = CryptoCurrencyPaginationInfo(count: 0, pagination: 1)
//            
//            return .success((entityList: cryptoList, paginationInfo: mockPaginationInfo))
//        } catch {
//            return .failure(error)
//        }
//        
//    }
//    
//    func fetchCryptoData(){
//        
//    }
}
