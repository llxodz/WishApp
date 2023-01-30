//
//  WishObject.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 30.01.2023.
//

import Foundation
import RealmSwift

final class WishObject: Object {
    
    @Persisted(primaryKey: true) var id: Int
    @Persisted var title: String
    @Persisted var descriptionString: String
    @Persisted var link: String?
    @Persisted var labels: String?
    
    convenience init(id: Int, title: String, descriptionString: String, link: String?, labels: String?) {
        self.init()
        self.id = id
        self.title = title
        self.descriptionString = descriptionString
        self.link = link
        self.labels = labels
    }
}

extension WishObject {
    convenience init(_ model: Wish) {
        self.init()
        id = model.id
        title = model.title
        descriptionString = model.description
        link = model.link
    }
}
