//
//  UIView+Extensions.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 25.12.2022.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
    func baseSeparatorLine() -> UIView {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }
}
