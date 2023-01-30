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
    
    init(wishRepository: WishRepository = WishRepository()) {
        self.wishRepository = wishRepository
    }
    
    func getWishList() -> [Wish] {
        return [
            .init(id: 0, title: "Скакалка", description: "Хочу для того, чтобы начать заниматься спортом sasdhahc asdhasdhasjhdhjas dahjs dsahjd ahshdja  d", link: nil, labels: nil),
            .init(id: 1, title: "Робот-пылесос 2", description: "", link: "sss", labels: nil),
            .init(id: 2, title: "Лего", description: "Лего гарри поттер для пополнения коллекции. Немного дороговато, но зато любимое", link: "https://ozon.ru", labels: nil),
            .init(id: 3, title: "Робот-пылесос", description: "", link: nil, labels: nil),
            .init(id: 4, title: "Лего", description: "Лего гарри поттер для пополнения коллекции. Немного дороговато, но зато любимое. Лего гарри поттер для пополнения коллекции. Немного дороговато, но зато любимое", link: "", labels: nil),
        ]
    }
    
    func getData() -> [Wish] {
        let cache = wishRepository.getDataList()
        
        return cache
    }
    
    func saveData(_ data: Wish) {
        wishRepository.saveDataList([data])
    }
}
