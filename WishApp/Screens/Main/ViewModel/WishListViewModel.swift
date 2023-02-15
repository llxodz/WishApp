//
//  WishListViewModel.swift
//  WishApp
//
//  Created by Ilya Gavrilov on 26.12.2022.
//

import UIKit

protocol WishListViewModelProtocol {
    func getWishList() -> [Wish]
}

final class WishListViewModel: WishListViewModelProtocol {
    
    private let wishRepository: WishRepository
    private var wishList: [Wish] = []
    
    init(wishRepository: WishRepository = WishRepository()) {
        self.wishRepository = wishRepository
    }
    
    func getWishList() -> [Wish] {
        return wishList
    }
    
    func addWish(_ wish: Wish) {
        wishList.append(wish)
    }
    
    func deleteWish(at indexPath: Int) {
        if wishList.count > 0 {
            wishList.remove(at: indexPath)
        }
    }
    
    func deleteAllWishes() {
        if wishList.count > 0 {
            wishList.removeAll()
        }
    }
    
    func getData() -> [Wish] {
        let cache = wishRepository.getDataList()
        
        return cache
    }
    
    func saveData(_ data: Wish) {
        wishRepository.saveDataList([data])
    }
}
