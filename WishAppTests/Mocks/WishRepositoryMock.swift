//
//  WishRepositoryMock.swift
//  WishAppTests
//
//  Created by Ilya Gavrilov on 20.02.2023.
//

import Foundation
@testable import WishApp

final class WishRepositoryMock: ModelRepository {
    typealias Model = Wish

    var invokedGetDataList = false
    var invokedGetDataListCount = 0
    var stubbedGetDataListResult: [Model]! = []

    func getDataList() -> [Model] {
        invokedGetDataList = true
        invokedGetDataListCount += 1
        return stubbedGetDataListResult
    }

    var invokedSaveDataList = false
    var invokedSaveDataListCount = 0
    var invokedSaveDataListParameters: (data: [Wish], Void)?
    var invokedSaveDataListParametersList = [(data: [Wish], Void)]()

    func saveDataList(_ data: [Wish]) {
        invokedSaveDataList = true
        invokedSaveDataListCount += 1
        invokedSaveDataListParameters = (data, ())
        invokedSaveDataListParametersList.append((data, ()))
    }

    var invokedClearDataList = false
    var invokedClearDataListCount = 0

    func clearDataList() {
        invokedClearDataList = true
        invokedClearDataListCount += 1
    }
}
