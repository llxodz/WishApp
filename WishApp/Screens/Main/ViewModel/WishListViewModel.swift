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

class WishListViewModel: WishListViewModelProtocol {
    
    func getWishList() -> [Wish] {
        return [
            .init(title: "Скакалка", description: "Хочу для того, чтобы начать заниматься спортом sasdhahc asdhasdhasjhdhjas dahjs dsahjd ahshdja  d", link: nil, labels: nil),
            .init(title: "Робот-пылесос 2", description: "", link: "sss", labels: nil),
            .init(title: "Лего", description: "Лего гарри поттер для пополнения коллекции. Немного дороговато, но зато любимое", link: "https://ozon.ru", labels: nil),
            .init(title: "Робот-пылесос", description: "", link: nil, labels: nil),
            .init(title: "Лего", description: "Лего гарри поттер для пополнения коллекции. Немного дороговато, но зато любимое. Лего гарри поттер для пополнения коллекции. Немного дороговато, но зато любимое", link: "", labels: nil),
        ]
    }
}
