//
//  HeaderWishListView.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 25.12.2022.
//

import UIKit
import SnapKit

private enum Constants {
    static let titleFont = FontFamily.Montserrat.bold.font(size: 20)
    static let heightSeparator: CGFloat = 0.5
}

final class HeaderWishListView: UIView {
    
    private lazy var titleLabel = UILabel()
    private lazy var separatorLine = UIView().baseSeparatorLine()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addViews()
        configureLayout()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func addViews() {
        addSubviews(titleLabel, separatorLine)
    }
    
    private func configureLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        separatorLine.snp.makeConstraints {
            $0.height.equalTo(Constants.heightSeparator)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureAppearance() {
        backgroundColor = .white
        
        titleLabel.text = L10n.wishList
        titleLabel.font = Constants.titleFont
    }
}
