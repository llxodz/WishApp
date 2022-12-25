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
    private lazy var wishListTableView = UITableView()
    private lazy var addWishButton = WishButtonView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureLayout()
        configureAppearance()
        configureTableView()
    }
    
    // MARK: - Private
    
    private func addViews() {
        view.addSubviews(headerView, wishListTableView ,addWishButton)
    }
    
    private func configureLayout() {
        headerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constants.headerHeight)
        }
        wishListTableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        addWishButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.height.equalTo(Constants.headerHeight)
            $0.leading.equalToSuperview().inset(CGFloat.baseMargin)
            $0.trailing.equalToSuperview().inset(CGFloat.baseMargin)
        }
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        addWishButton.backgroundColor = .clear
    }
    
    private func configureTableView() {
        wishListTableView.tableFooterView = UIView(frame: .zero)
        wishListTableView.delegate = self
        wishListTableView.dataSource = self
        wishListTableView.delaysContentTouches = false
        wishListTableView.register(WishTableViewCell.self, forCellReuseIdentifier: WishTableViewCell.identifier)
        wishListTableView.rowHeight = UITableView.automaticDimension
        wishListTableView.separatorStyle = .none
        wishListTableView.showsVerticalScrollIndicator = false
        wishListTableView.estimatedRowHeight = 84
    }
    
    @objc func addWishButtonTapped() {
        print(#function)
    }
}

// MARK: - Extensions UITableView

extension WishListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: WishTableViewCell.identifier,
            for: indexPath
        ) as? WishTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        wishListTableView.deselectRow(at: indexPath, animated: true)
    }
}

