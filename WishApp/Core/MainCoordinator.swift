//
//  MainCoordinator.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 09.03.2023.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startApp() {
        let vc = WishListViewController()
        vc.coordinator = self
        navigationController.isNavigationBarHidden = true
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToWishDetailScreen() {
        let vc = WishDetailViewController()
        navigationController.isNavigationBarHidden = false
        navigationController.pushViewController(vc, animated: true)
    }
}
