//
//  ProductsRepository.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Jaden Nation on 5/2/22.
//

import Foundation

class ProductsRepository: NSObject, Repository {
    typealias T = Product
    static var storageKey: String { String(describing: ProductsRepository.self) }
    
    func get(id: Int) -> Product? {
        getAll().filter({$0.id == id}).first
    }
    
    
    func set(record: Product) {
        var products = getAll().filter({$0.id != record.id})
        products.append(record)
        set(records: products)
    }
    
    func set(records: [Product]) {
        guard let encodedData = try? PropertyListEncoder().encode(records) else {
                return
            }
        UserDefaults.standard.set(encodedData, forKey: ProductsRepository.storageKey)
    }

}
