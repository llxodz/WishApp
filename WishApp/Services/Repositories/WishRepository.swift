//
//  WishRepository.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 30.01.2023.
//

import Foundation

final class WishRepository: ModelRepository {

    typealias Model = Wish
    
    private let storage: StorageService
        
    init(storage: StorageService) {
        self.storage = storage
    }
    
    func getDataList() -> [Wish] {
        let data = storage.fetch(by: WishObject.self)
        return data.map(Wish.init)
    }
    
    func saveDataList(_ data: [Wish]) {
        let objects = data.map(WishObject.init)
        try? storage.saveOrUpdateAllObjects(objects: objects)
    }

    func clearDataList() {
        try? storage.deleteAll()
    }
}
