//
//  Cart.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Jaden Nation on 5/2/22.
//

import Foundation

struct Cart: Codable, Equatable {
    var productIds = [Int]()
    
    mutating func addProduct(id: Int) {
        guard !productIds.contains(id) else {
            return
        }
        self.productIds.append(id)
        CartsRepository().set(record: self)
    }
    
    mutating func removeProduct(id: Int) {
        self.productIds = self.productIds.filter({$0 != id})
        CartsRepository().set(record: self)
    }
    
    
}
