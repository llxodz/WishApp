//
//  SceneDelegate.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 25.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navController = UINavigationController()
        let window = UIWindow(windowScene: windowScene)
        let coordinator = MainCoordinator(navigationController: navController)
        
        window.rootViewController = navController
        window.makeKeyAndVisible()
        self.window = window
        
        coordinator.startApp()
    }
}

