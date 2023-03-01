//
//  StorageServiceMock.swift
//  WishAppTests
//
//  Created by Ilya Gavrilov on 20.02.2023.
//

import Foundation
import RealmSwift
import WishApp

final class StorageServiceMock: StorageService {

    var invokedSaveOrUpdateObject = false
    var invokedSaveOrUpdateObjectCount = 0
    var invokedSaveOrUpdateObjectParameters: (object: Object, Void)?
    var invokedSaveOrUpdateObjectParametersList = [(object: Object, Void)]()
    var stubbedSaveOrUpdateObjectError: Error?

    func saveOrUpdateObject(object: Object) throws {
        invokedSaveOrUpdateObject = true
        invokedSaveOrUpdateObjectCount += 1
        invokedSaveOrUpdateObjectParameters = (object, ())
        invokedSaveOrUpdateObjectParametersList.append((object, ()))
        if let error = stubbedSaveOrUpdateObjectError {
            throw error
        }
    }

    var invokedSaveOrUpdateAllObjects = false
    var invokedSaveOrUpdateAllObjectsCount = 0
    var invokedSaveOrUpdateAllObjectsParameters: (objects: [Object], Void)?
    var invokedSaveOrUpdateAllObjectsParametersList = [(objects: [Object], Void)]()
    var stubbedSaveOrUpdateAllObjectsError: Error?

    func saveOrUpdateAllObjects(objects: [Object]) throws {
        invokedSaveOrUpdateAllObjects = true
        invokedSaveOrUpdateAllObjectsCount += 1
        invokedSaveOrUpdateAllObjectsParameters = (objects, ())
        invokedSaveOrUpdateAllObjectsParametersList.append((objects, ()))
        if let error = stubbedSaveOrUpdateAllObjectsError {
            throw error
        }
    }

    var invokedDelete = false
    var invokedDeleteCount = 0
    var invokedDeleteParameters: (object: Object, Void)?
    var invokedDeleteParametersList = [(object: Object, Void)]()
    var stubbedDeleteError: Error?

    func delete(object: Object) throws {
        invokedDelete = true
        invokedDeleteCount += 1
        invokedDeleteParameters = (object, ())
        invokedDeleteParametersList.append((object, ()))
        if let error = stubbedDeleteError {
            throw error
        }
    }

    var invokedDeleteAll = false
    var invokedDeleteAllCount = 0
    var stubbedDeleteAllError: Error?

    func deleteAll() throws {
        invokedDeleteAll = true
        invokedDeleteAllCount += 1
        if let error = stubbedDeleteAllError {
            throw error
        }
    }

    var invokedFetch = false
    var invokedFetchCount = 0
    var invokedFetchParameters: (type: Any, Void)?
    var invokedFetchParametersList = [(type: Any, Void)]()
    var stubbedFetchResult: [Any]! = []

    func fetch<T: Object>(by type: T.Type) -> [T] {
        invokedFetch = true
        invokedFetchCount += 1
        invokedFetchParameters = (type, ())
        invokedFetchParametersList.append((type, ()))
        return stubbedFetchResult as! [T]
    }
}
