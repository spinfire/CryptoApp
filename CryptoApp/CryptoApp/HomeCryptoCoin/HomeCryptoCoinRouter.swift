//
//  HomeCryptoCoinRouter.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation
import UIKit

protocol HomeCryptoCoinRouting: AnyObject {
    var homeCryptoCoinView: HomeCryptoCoinView? {get}
    var detailCryptoCoinRouter: DetailCryptoCoinRouting? {get}
    
    func showHomeCryptoCoin(window: UIWindow?)
    func showDetailCryptoCoin(withEntity entity: HomeCryptoCoinEntity)
}

class HomeCryptoCoinRouter: HomeCryptoCoinRouting{
    var homeCryptoCoinView: HomeCryptoCoinView?
    var detailCryptoCoinRouter: DetailCryptoCoinRouting?
    
    func showHomeCryptoCoin(window: UIWindow?){
        self.detailCryptoCoinRouter = DetailCryptoCoinRouter()
        let interactor = HomeCryptoCoinInteractor(apiManager: ApiManager())
        let presenter = HomeCryptoCoinPresenter(homeCryptoCoinInteractor: interactor, router: self)
        homeCryptoCoinView = HomeCryptoCoinView(presenter: presenter)
        presenter.ui = homeCryptoCoinView
        window?.rootViewController = UINavigationController(rootViewController: homeCryptoCoinView ?? UIViewController())
        window?.makeKeyAndVisible()
    }
    
    func showDetailCryptoCoin(withEntity entity: HomeCryptoCoinEntity){
        guard let fromViewController = homeCryptoCoinView else { return }
        let modelDetail = MapperDetailCryptoCoin().map(entity: entity)
        detailCryptoCoinRouter?.showDetail(fromViewController: fromViewController, withViewModel: modelDetail)
    }
}
