//
//  MapperHomeCryptoCoinTests.swift
//  CryptoAppTests
//
//  Created by manuel benites rojas on 6/6/24.
//

import XCTest
@testable import CryptoApp

final class MapperHomeCryptoCoinTests: XCTestCase {

    var mapper: MapperHomeCryptoCoin!
    
    override func setUpWithError() throws {
        mapper = MapperHomeCryptoCoin()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMap(){
        
        let entity: HomeCryptoCoinEntity = HomeCryptoCoinEntity(coinInfo: CoinInfo(id: "", name: "", fullName: "", imageUrl: ""), display: DisplayInfo(eur: CurrencyDisplayInfo(price: "", volume24Hour: "")))
        
        let viewModel = mapper.map(entity: entity)
        
//        XCTAssertEqual(viewModel.price, )
    }

}
