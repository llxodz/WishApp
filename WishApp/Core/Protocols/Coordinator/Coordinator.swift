//
//  Coordinator.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 09.03.2023.
//

import UIKit

public protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func startApp()
    func goToWishDetailScreen()
}
