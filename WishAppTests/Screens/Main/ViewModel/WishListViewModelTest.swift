//
//  WishViewModelTest.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 20.02.2023.
//

import XCTest
@testable import WishApp

final class WishListViewModelTest: XCTestCase {
    
    var viewModel: WishListViewModel!
    var wish: Wish!

    override func setUpWithError() throws {
        self.setUp()
        viewModel = WishListViewModel()
        wish = Wish(id: 0, title: "title", description: "desc", link: nil, labels: nil)
    }

    override func tearDownWithError() throws {
        self.tearDown()
        viewModel = nil
    }
    
    func testInitWishListViewModelWithZeroWishes() {
        XCTAssertEqual(viewModel.getWishList().count, 0)
    }
    
    func testAddWishInWishListViewModel() {
        viewModel.addWish(wish)
        
        XCTAssertEqual(viewModel.getWishList().count, 1)
    }
    
    func testDeleteWishInWishListViewModel() {
        viewModel.deleteWish(at: 0)
        
        XCTAssertEqual(viewModel.getWishList().count, 0)
    }
    
    func testDeleteAllWishesInWishListViewModel() {
        viewModel.addWish(wish)
        viewModel.addWish(wish)
        viewModel.addWish(wish)
        
        XCTAssertEqual(viewModel.getWishList().count, 3)
        
        viewModel.deleteAllWishes()
        
        XCTAssertEqual(viewModel.getWishList().count, 0)
    }
}
