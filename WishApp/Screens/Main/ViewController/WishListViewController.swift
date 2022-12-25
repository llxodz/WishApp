//
//  ViewController.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 25.12.2022.
//

import UIKit
import SnapKit

private enum Constants {
    static let headerHeight: CGFloat = 56
}

class WishListViewController: UIViewController {
    
    private lazy var headerView = HeaderWishListView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureLayout()
        configureAppearance()
    }
    
    // MARK: - Private
    
    private func addViews() {
        view.addSubviews(headerView)
    }
    
    private func configureLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constants.headerHeight)
        }
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
    }
}

