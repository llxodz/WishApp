//
//  WishViewModelTest.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 20.02.2023.
//

import XCTest
import RealmSwift
@testable import WishApp

final class WishListViewModelTests: XCTestCase {
    
    private var viewModel: WishListViewModel!
    private var storageServiceMock: StorageServiceMock!
    private var wish: Wish!

    override func setUpWithError() throws {
        self.setUp()
        storageServiceMock = StorageServiceMock()
        viewModel = WishListViewModel(wishRepository: WishRepository(storage: storageServiceMock))
        wish = Wish(id: 0, title: "title2", description: "desc", link: nil, labels: nil)
    }

    override func tearDownWithError() throws {
        viewModel = nil
        storageServiceMock = nil
        wish = nil
        self.tearDown()
    }
    
    func testInitWishListViewModelWithZeroWishes() {
        // when
        let fake = WishObject(id: 0, title: "title", descriptionString: "desc", link: nil, labels: nil)
        // given
        storageServiceMock.stubbedFetchResult = [fake, fake]
        // then
        XCTAssertEqual(viewModel.getWishList().count, 2)
    }
    
    func testAddWishInWishListViewModel() {
        // given
        viewModel.addWish(wish)
        // then
        let wishObject = storageServiceMock.invokedSaveOrUpdateAllObjectsParameters?.objects[0] as? WishObject
        XCTAssertTrue(storageServiceMock.invokedSaveOrUpdateAllObjects)
        XCTAssertEqual(wishObject?.title, "title2")
    }
}
