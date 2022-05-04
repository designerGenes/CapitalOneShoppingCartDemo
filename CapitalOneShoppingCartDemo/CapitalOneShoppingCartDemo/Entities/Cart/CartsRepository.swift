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
    static var storageForProductsKey: String { String(describing: ProductsRepository.self) }
    
    var products: [Product] = []
    var productRepository: ProductsRepository = ProductsRepository()
    

    
    func getAllProductsInCart() -> [Product]{
        var arrProduct:[Product] = [Product]()
       
        if let cart = getCart() as? Cart{
            for item in cart.productIds{
                arrProduct.append(self.productRepository.get(id: item) ?? Product.emptyProduct)
            }
        }
        
        print(arrProduct)
        return arrProduct
    }
    
    func get(id: Int) -> Cart? {
        getCart()
    }
    
    func getCart() -> Cart {
        guard let cart = getAll().first else {
            let newCart = Cart()
            set(record: newCart)
            return newCart
        }
        return cart
    }
    
    func set(record: Cart) {
        guard let encodedData = try? PropertyListEncoder().encode(record) else {
                return
            }
        UserDefaults.standard.set([encodedData], forKey: CartsRepository.storageKey)
    }
    
    
}
