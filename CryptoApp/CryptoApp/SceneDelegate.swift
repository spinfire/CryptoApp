//
//  SceneDelegate.swift
//  CryptoApp
//
//  Created by manuel benites rojas on 20/5/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var homeCryptoRouter = HomeCryptoCoinRouter()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        homeCryptoRouter.showHomeCryptoCoin(window: window)
    }

}

