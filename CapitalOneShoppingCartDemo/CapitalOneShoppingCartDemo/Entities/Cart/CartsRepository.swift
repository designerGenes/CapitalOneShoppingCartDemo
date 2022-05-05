//
//  CartRepository.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Jaden Nation on 5/2/22.
//

import Foundation
import Combine

class CartsRepository: NSObject, Repository {
    //MARK: - Variables
    typealias T = Cart
    static var storageKey: String { String(describing: CartsRepository.self) }
    static var storageForProductsKey: String { String(describing: ProductsRepository.self) }
    var products: [Product] = []
    
    //MARK: - Custom Methods
    func getAllProductsInCart() -> AnyPublisher<[Product], Never>{
        return Future<[Product], Never> { promise in
            self.loadProduct{ products in
                DispatchQueue.main.async {
                  promise(.success(products))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    private func loadProduct(completion: @escaping ([Product]) -> Void){
        DispatchQueue.global(qos: .background).async {
          let products = self.loadSynchronously()
          completion(products)
        }

    }

    private func loadSynchronously() -> [Product] {
        var arrProduct: [Product] = [Product]()
        let productRepository = ProductsRepository()
        for item in getCart().productIds {
            arrProduct.append(productRepository.get(id: item) ?? Product.emptyProduct)
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
        let encodedRecord = try? PropertyListEncoder().encode(record)
        UserDefaults.standard.set([encodedRecord], forKey: CartsRepository.storageKey)
    }
    
    
}
