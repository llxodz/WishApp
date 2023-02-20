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
    static let estimatedRowHeight: CGFloat = 32
}

class WishListViewController: UIViewController {
    
    private lazy var headerView = HeaderWishListView()
    private lazy var wishListTableView = UITableView()
    private lazy var addWishButton = WishButtonView()
    private var id: Int = -1
    
    var viewModel: WishListViewModel?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureLayout()
        configureAppearance()
        configureTableView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = WishListViewModel()
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
            $0.top.equalTo(headerView.snp.bottom).offset(CGFloat.smallMargin)
            $0.leading.trailing.equalToSuperview().inset(CGFloat.baseMargin)
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
        wishListTableView.separatorStyle = .none
        wishListTableView.showsVerticalScrollIndicator = false
        wishListTableView.rowHeight = UITableView.automaticDimension
        wishListTableView.estimatedRowHeight = Constants.estimatedRowHeight
    }
    
    @objc func addWishButtonTapped() {
        print(#function)
        self.viewModel?.saveData(Wish(id: self.id, title: "sd", description: "sddsd", link: nil, labels: nil))
        self.wishListTableView.reloadData()
    }
}

// MARK: - Extensions UITableView

extension WishListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getWishList().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WishTableViewCell.identifier, for: indexPath) as? WishTableViewCell,
              let viewModel = viewModel
        else { return UITableViewCell() }
        
        cell.configure(with: (viewModel.getWishList()[indexPath.row]))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        wishListTableView.deselectRow(at: indexPath, animated: true)
    }
}

