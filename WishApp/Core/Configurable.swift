//
//  Configurable.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 26.12.2022.
//

import Foundation

public protocol Configurable: AnyObject {
    
    associatedtype Model
    
    func configure(with model: Model)
}
