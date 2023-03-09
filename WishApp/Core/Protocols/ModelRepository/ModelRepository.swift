//
//  ModelRepository.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 30.01.2023.
//

import Foundation

public protocol ModelRepository {
    
    associatedtype Model
    
    func getDataList() -> [Model]
    func saveDataList(_ data: [Model])
    func clearDataList()
}
