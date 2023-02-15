//
//  WishTableViewCell.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 25.12.2022.
//

import UIKit
import SnapKit

private enum Constants {
    static let titleLabelFont = FontFamily.Montserrat.bold.font(size: 16)
    static let descriptionLabelFont = FontFamily.Montserrat.medium.font(size: 12)
    
    static let imageLink: UIImage = Asset.linkImage.image
    static let imageLinkSize: CGFloat = 18
}

final class WishTableViewCell: UITableViewCell {
    
    // Public property
    public static var identifier: String {
        String(describing: self)
    }
    
    // Private property
    private var model: Wish?
    
    // UI
    private lazy var titleWishLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = Constants.titleLabelFont
        return label
    }()
    private lazy var linkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constants.imageLink
        return imageView
    }()
    private lazy var descriptionWishLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .gray
        label.font = Constants.descriptionLabelFont
        return label
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        configureLayout()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private
    
    private func addViews() {
        contentView.addSubviews(titleWishLabel, linkImageView, descriptionWishLabel)
    }
    
    private func configureLayout() {
        titleWishLabel.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top).inset(CGFloat.smallMargin)
            $0.leading.equalTo(self.contentView.snp.leading).inset(CGFloat.smallMargin)
            $0.trailing.equalTo(linkImageView.snp.leading)
        }
        linkImageView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.imageLinkSize)
            $0.leading.equalTo(titleWishLabel.snp.trailing)
            $0.centerY.equalTo(titleWishLabel.snp.centerY)
            $0.trailing.equalTo(self.contentView.snp.trailing).inset(CGFloat.smallMargin)
        }
        descriptionWishLabel.snp.makeConstraints {
            $0.top.equalTo(titleWishLabel.snp.bottom).offset(CGFloat.smallMargin)
            $0.leading.trailing.equalToSuperview().inset(CGFloat.smallMargin)
            $0.bottom.equalTo(self.contentView.snp.bottom).inset(CGFloat.smallMargin)
        }
    }
    
    private func configureAppearance() {
        layer.cornerRadius = .baseRadius
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.gray.cgColor
        clipsToBounds = true
    }
    
    private func updateLayout() {
        titleWishLabel.snp.removeConstraints()
        descriptionWishLabel.snp.removeConstraints()
        linkImageView.snp.removeConstraints()
        
        titleWishLabel.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top).inset(CGFloat.smallMargin)
            $0.leading.equalTo(self.contentView.snp.leading).inset(CGFloat.smallMargin)
            $0.trailing.equalTo(linkImageView.snp.leading)
            $0.bottom.equalTo(self.contentView.snp.bottom).inset(CGFloat.smallMargin)
        }
        linkImageView.snp.makeConstraints {
            $0.height.width.equalTo(Constants.imageLinkSize)
            $0.leading.equalTo(titleWishLabel.snp.trailing)
            $0.trailing.equalTo(self.contentView.snp.trailing).inset(CGFloat.smallMargin)
            $0.centerY.equalTo(titleWishLabel.snp.centerY)
        }
    }
}

// MARK: - Configurable

extension WishTableViewCell: Configurable {
    
    typealias Model = Wish
    
    func configure(with model: Wish) {
        self.model = model
        
        titleWishLabel.text = model.title
        if model.description.isEmpty {
            self.updateLayout()
        } else {
            descriptionWishLabel.text = model.description
        }
        linkImageView.isHidden = model.link != nil ? false : true
    }
}
