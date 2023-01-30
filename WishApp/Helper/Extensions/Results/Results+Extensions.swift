//
//  Result+Extensions.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 30.01.2023.
//

import Foundation
import RealmSwift

extension Results {
    
    func toArray() -> [Element] {
        .init(self)
    }
}
