//
//  WishListViewModel.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 26.12.2022.
//

import UIKit

protocol WishListViewModelProtocol {
    func getWishList() -> [Wish]
    func addWish(_ wish: Wish)
}

final class WishListViewModel: WishListViewModelProtocol {
    
    private let wishRepository: WishRepository
    
    init(wishRepository: WishRepository) {
        self.wishRepository = wishRepository
    }
    
    func getWishList() -> [Wish] {
        return wishRepository.getDataList()
    }
    
    func addWish(_ wish: Wish) {
        wishRepository.saveDataList([wish])
    }
}
