//
//  CartRepository.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Jaden Nation on 5/2/22.
//

import Foundation

class CartsRepository: NSObject, Repository {
    typealias T = Cart
    static var storageKey: String { String(describing: CartsRepository.self) }
    
    func get(id: Int) -> Cart? {
        getCart()
    }
    
    func getCart() -> Cart? {
        getAll().first
    }
    
    func set(record: Cart) {
        UserDefaults.standard.set([record], forKey: CartsRepository.storageKey)
    }
    
    
}
