//
//  CryptoAppTests.swift
//  CryptoAppTests
//
//  Created by manuel benites rojas on 20/5/24.
//

import XCTest
@testable import CryptoApp

final class HomeCryptoCoinViewModelTests: XCTestCase {

    func testHomeCryptoCoinViewModelInicialization(){
        //given or arrange
        
        let title = "Test Title"
        let subtitle = "Test Subtitle"
        let price = "Test Price"
        
        //when or act
        let viewModel = HomeCryptoCoinViewModel(title: title, subtitle: subtitle, price: price)
        
        //them or assert
        XCTAssertEqual(viewModel.title, title, "Title should be equal to Test Title")
        XCTAssertEqual(viewModel.subtitle, subtitle, "Subtitle should be equal to Test Subtitle")
        XCTAssertEqual(viewModel.price, price, "Price should be equal to Test Price")
    }
}
