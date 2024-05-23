//
//  DetailCryptoCoinRouter.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import Foundation
import SwiftUI

protocol DetailCryptoCoinRouting: AnyObject {
    func showDetail(fromViewController: UIViewController, withViewModel viewModel: DetailCryptoCoinViewModel)
}
class DetailCryptoCoinRouter: DetailCryptoCoinRouting {
    func showDetail(fromViewController: UIViewController, withViewModel viewModel: DetailCryptoCoinViewModel) {
        let interactor = DetailCryptoCoinInteractor()
        let presenter = DetailCryptoCoinPresenter()
        let view = UIHostingController(rootView: DetailCryptoCoinView(viewModel: viewModel))
        fromViewController.navigationController?.pushViewController(view, animated: true)
    }
}
