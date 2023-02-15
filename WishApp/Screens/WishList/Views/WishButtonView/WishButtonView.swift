//
//  WishButtonView.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 25.12.2022.
//

import UIKit
import SnapKit

private enum Constants {
    static let heightButton: CGFloat = 56
    static let selectedAlpha: CGFloat = 0.3
    static let whiteSelected: CGFloat  = 0.5
    
    static let buttonRadius: CGFloat = 28
}

final class WishButtonView: UIView {
    
    // UI
    private lazy var addWishButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.buttonRadius
        button.addTarget(nil, action: #selector(WishListViewController.addWishButtonTapped), for: .touchUpInside)
        button.setImage(Asset.plusImage.image, for: .normal)
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addViews()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func addViews() {
        addSubview(addWishButton)
    }
    
    private func configureLayout() {
        addWishButton.snp.makeConstraints {
            $0.height.width.equalTo(Constants.heightButton)
            $0.centerY.trailing.equalToSuperview()
        }
    }
}
