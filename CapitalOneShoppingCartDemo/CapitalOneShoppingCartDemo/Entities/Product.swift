//
//  Product.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation

// Holds product details 
struct Product: Codable{
    let id: Int
    let title: String
    let price: Int
    let description: String
    let discountPercentage: Double
    let rating: Double
    let stock: Double
    let brand: String
    let category: String
    let thumbnail: String
    
}
