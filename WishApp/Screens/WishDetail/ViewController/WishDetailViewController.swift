//
//  WishDetailViewController.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 09.03.2023.
//

import UIKit
import SnapKit

private enum Constants {
    static let titleFont: UIFont = FontFamily.Montserrat.semiBold.font(size: 18)
    static let descriptionTextViewFont: UIFont = FontFamily.Montserrat.medium.font(size: 14)
    static let linkTextFieldFont: UIFont = FontFamily.Montserrat.medium.font(size: 16)
    
    static let descriptionTextViewHeight: CGFloat = 104
    static let descriptionImageViewHeight: CGFloat = 24
    static let titleTextFieldHeight: CGFloat = 52
    static let separatorHeight: CGFloat = 0.5
    static let descriptionBorderWidth: CGFloat = 0.5
    
    static let descriptionImage: UIImage = Asset.descriptionIconImage.image
}

final class WishDetailViewController: UIViewController {
    
    // UI
    private lazy var separatorTopLine = UIView().baseSeparatorLine()
    private lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Place holder"
        textField.returnKeyType = .done
        textField.font = Constants.titleFont
        return textField
    }()
    private lazy var separatorTitleTextField = UIView().baseSeparatorLine()
    private lazy var separatorLinkTextField = UIView().baseSeparatorLine()
    private lazy var descriptionImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Asset.descriptionIconImage.image
        return imageView
    }()
    private lazy var descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.font = Constants.descriptionTextViewFont
        textView.returnKeyType = .done
        textView.layer.borderWidth = Constants.descriptionBorderWidth
        textView.layer.cornerRadius = .baseRadius
        textView.layer.masksToBounds = true
        textView.layer.borderColor = UIColor.black.cgColor
        return textView
    }()
    private lazy var linkTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Link"
        textField.textContentType = .URL
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.returnKeyType = .done
        textField.font = Constants.linkTextFieldFont
        return textField
    }()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        addViews()
        configureLayout()
        configureAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.tintColor = .black
        navigationController?.isNavigationBarHidden = false
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    // MARK: - Private
    
    private func addViews() {
        view.addSubviews(separatorTopLine,
                         titleTextField,
                         separatorTitleTextField,
                         descriptionTextView,
                         descriptionImage,
                         linkTextField,
                         separatorLinkTextField
        )
    }
    
    private func configureLayout() {
        separatorTopLine.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(Constants.separatorHeight)
        }
        titleTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(CGFloat.tinyMargin)
            $0.leading.equalTo(view.snp.leading).inset(CGFloat.smallMargin)
            $0.trailing.equalTo(view.snp.trailing).inset(CGFloat.smallMargin)
            $0.height.equalTo(Constants.titleTextFieldHeight)
        }
        separatorTitleTextField.snp.makeConstraints {
            $0.bottom.equalTo(titleTextField.snp.bottom)
            $0.leading.equalTo(titleTextField.snp.leading)
            $0.trailing.equalTo(titleTextField.snp.trailing)
            $0.height.equalTo(Constants.separatorHeight)
        }
        descriptionTextView.snp.makeConstraints {
            $0.top.equalTo(separatorTitleTextField.snp.bottom).offset(CGFloat.smallMargin)
            $0.leading.equalTo(descriptionImage.snp.trailing)
            $0.trailing.equalTo(view.snp.trailing).inset(CGFloat.smallMargin)
            $0.height.equalTo(40)
        }
        descriptionImage.snp.makeConstraints {
            $0.top.equalTo(separatorTitleTextField.snp.bottom).offset(CGFloat.smallMargin)
            $0.leading.equalTo(view.snp.leading).inset(CGFloat.smallMargin)
            $0.trailing.equalTo(descriptionTextView.snp.leading)
            $0.height.width.equalTo(Constants.descriptionImageViewHeight)
        }
        linkTextField.snp.makeConstraints {
            $0.top.equalTo(descriptionTextView.snp.bottom).offset(CGFloat.smallMargin)
            $0.leading.equalTo(view.snp.leading).inset(CGFloat.smallMargin)
            $0.trailing.equalTo(view.snp.trailing).inset(CGFloat.smallMargin)
        }
        separatorLinkTextField.snp.makeConstraints {
            $0.bottom.equalTo(linkTextField.snp.bottom)
            $0.leading.equalTo(linkTextField.snp.leading)
            $0.trailing.equalTo(linkTextField.snp.trailing)
            $0.height.equalTo(Constants.separatorHeight)
        }
    }
    
    private func configureAppearance() {
        view.backgroundColor = .white
        titleTextField.delegate = self
        descriptionTextView.delegate = self
        descriptionTextView.isScrollEnabled = false
    }
}

// MARK: - Extensions UITextFieldDelegate

extension WishDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.resignFirstResponder()
        return true
    }
}

// MARK: - Extensions UITextViewDelegate

extension WishDetailViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach { constraint in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
                textView.updateConstraintsIfNeeded()
            }
        }
    }
}
