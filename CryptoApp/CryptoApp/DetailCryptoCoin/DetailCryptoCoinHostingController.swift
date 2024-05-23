//
//  DetailCryptoCoinHostingController.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 22/5/24.
//

import Foundation
import UIKit
import SwiftUI

protocol ViewProtocol: UIViewController {
    func showUpdatedContent(
        updatedName: String,
        updatedCount: Int
    )
}
 
class DetailCryptoCoinHostingController: UIHostingController<DetailCryptoCoinView> {
    private let state = MyState()
    private let interactor: DetailCryptoCoinInteractor
    private let viewModel: DetailCryptoCoinViewModel
    
    init(interactor: DetailCryptoCoinInteractor, viewModel: DetailCryptoCoinViewModel ) {
        self.interactor = interactor
        let namePublisher = state.$name.eraseToAnyPublisher()
        let countPublisher = state.$count.eraseToAnyPublisher()
        self.viewModel = viewModel
        let myView = DetailCryptoCoinView(viewModel: viewModel)
        super.init(rootView: myView)
    }
 
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 
extension DetailCryptoCoinHostingController: ViewProtocol {
    func showUpdatedContent(updatedName: String, updatedCount: Int) {
        DispatchQueue.main.async { [weak self] in
            self?.state.name = updatedName
            self?.state.count = updatedCount
        }
    }
}

private class MyState: ObservableObject {
    @Published var name = ""
    @Published var count = 0
}
