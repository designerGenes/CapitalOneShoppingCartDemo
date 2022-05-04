//
//  Cart.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Jaden Nation on 5/2/22.
//

import Foundation

class Cart: NSObject, Codable {
    var productIds = [Int]()
    
    func addProduct(id: Int) {
        guard !productIds.contains(id) else {
            return
        }
        self.productIds.append(id)
        CartsRepository().set(record: self)
    }
    
    func removeProduct(id: Int) {
        self.productIds = self.productIds.filter({$0 != id})
        CartsRepository().set(record: self)
    }
    
    
}
