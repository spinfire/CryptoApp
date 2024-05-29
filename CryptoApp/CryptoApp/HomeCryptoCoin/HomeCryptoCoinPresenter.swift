//
//  HomeCryptoCoinPresenter.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation
protocol HomeCryptoCoinPresentable: AnyObject {
    var ui: HomeCryptoCoinListUI? {get}
    var viewModels: [HomeCryptoCoinViewModel] {get}
    
    func onViewAppear()
    func onTapCell(atIndex: Int)
    func onViewScroll() 
}

protocol HomeCryptoCoinListUI: AnyObject {
    func update(cryptoCoins: [HomeCryptoCoinEntity])
}

class HomeCryptoCoinPresenter: HomeCryptoCoinPresentable {
    weak var ui: HomeCryptoCoinListUI?
    var viewModels: [HomeCryptoCoinViewModel] = []
    private var page = 0
    private let homeCryptoCoinInteractor : HomeCryptoCoinInteractor
    private var models: [HomeCryptoCoinEntity] = []
    private let mapper: MapperHomeCryptoCoin
    private let router: HomeCryptoCoinRouting
    
    init(homeCryptoCoinInteractor: HomeCryptoCoinInteractor, mapper: MapperHomeCryptoCoin = MapperHomeCryptoCoin(), router: HomeCryptoCoinRouting) {
        self.homeCryptoCoinInteractor = homeCryptoCoinInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onTapCell(atIndex: Int) {
        let model = models[atIndex]
        router.showDetailCryptoCoin(withEntity: model)
    }
    
    func onViewAppear() {
        Task{
            models = await homeCryptoCoinInteractor.getCryptoCoinList(page: page).data
            viewModels = models.map(mapper.map(entity:))
            ui?.update(cryptoCoins: models)
        }
    }
    
    func onViewScroll() {
        Task{
            self.page += 1
            let models = await homeCryptoCoinInteractor.getCryptoCoinList(page: page).data
            let viewModel = models.map(mapper.map(entity:))
            self.models.append(contentsOf: models)
            self.viewModels.append(contentsOf: viewModel)
            ui?.update(cryptoCoins: models)
        }
    }
}
