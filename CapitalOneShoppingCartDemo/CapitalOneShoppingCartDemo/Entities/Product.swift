//
//  Product.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation

// Holds product details 
struct Product: Codable,Equatable{
    let id: Int
    let title: String
    let price: Int
    let description: String
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String?
    
    
    static var emptyProduct: Product {
        Product(id: 0, title: "", price: 5, description: "", discountPercentage: 40.0, rating: 3.4, stock: 45, brand: "", category: "", thumbnail: "")
    }
    
}
