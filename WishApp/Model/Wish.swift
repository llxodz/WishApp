//
//  WishModel.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 26.12.2022.
//

import UIKit

struct Wish {
    let id: Int
    let title: String
    let description: String
    let link: String?
    let labels: [String]?
}

extension Wish {
    init(_ object: WishObject) {
        id = object.id
        title = object.title
        description = object.descriptionString
        link = object.link
        labels = nil
    }
}
