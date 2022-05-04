//
//  Cart.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Jaden Nation on 5/2/22.
//

import Foundation

class Cart: NSObject {
    var productIds = [String]()
    
    func addProduct(id: String) {
        guard !productIds.contains(id) else {
            return
        }
        productIds.append(id)
        CartsRepository().set(record: self)
    }
    
    func removeProduct(id: String) {
        productIds = productIds.filter({$0 != id})
        CartsRepository().set(record: self)
    }
    
    
}
