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
}

final class WishTableViewCell: UITableViewCell {
    
    // Public property
    public static var identifier: String {
        String(describing: self)
    }
    override public var frame: CGRect {
        get {
            return super.frame
        }
        set {
            var frame =  newValue
            frame.size.height -= 8
            super.frame = frame
        }
    }
    
    // UI
    private lazy var stackView = UIStackView()
    private lazy var titleWishLabel: UILabel = {
        let label = UILabel()
        label.text = "sdsddddd hshjashdjsahasjahdasdhkhsd hjsdajshdjashdjasdhsjhdjshjahdjahsdjashsjdja shdjadjshdjasdsjdad"
        label.numberOfLines = 2
        label.textColor = .black
        label.font = Constants.titleLabelFont
        return label
    }()
    private lazy var linkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.linkImage.image
        return imageView
    }()
    private lazy var descriptionWishLabel: UILabel = {
        let label = UILabel()
        label.text = "sовлфыовлф овлфыо лвфоылв офлв олыофлвфоылвфыофлыовфлывофлыовлфы олвыофлвфоылвфоыв nasjd jshjsdhjahd ja shaj sdhajs dhajs dhasjdhasjdahsjd hasjdh dj hasjd hasjd hasjd jashd jashd jsahd ajs dhsajdhaskdjashdkasjdhkasldjhlasdf  af dsfsdf dfsdf dfsf"
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
        stackView.addArrangedSubview(titleWishLabel)
        stackView.addArrangedSubview(linkImageView)
        addSubviews(stackView, descriptionWishLabel)
    }
    
    private func configureLayout() {
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.top.equalToSuperview().offset(8)
        }
        linkImageView.snp.makeConstraints {
            $0.height.width.equalTo(18)
        }
        descriptionWishLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(8)
            $0.top.equalTo(stackView.snp.bottom).offset(8)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
    
    private func configureAppearance() {
        layer.cornerRadius = 12    /// радиус закругления закругление
        layer.borderWidth = 1.0   // толщина обводки
        layer.borderColor = UIColor.gray.cgColor // цвет обводки
        clipsToBounds = true
    }
}
