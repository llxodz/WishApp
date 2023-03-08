//
//  BaseStorageService.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 20.02.2023.
//

import Foundation
import RealmSwift

public protocol StorageService {
    
    func saveOrUpdateObject(object: Object) throws
    func saveOrUpdateAllObjects(objects: [Object]) throws
    func delete(object: Object) throws
    func deleteAll() throws
    func fetch<T: Object>(by type: T.Type) -> [T]
}
