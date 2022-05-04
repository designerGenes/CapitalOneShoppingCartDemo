//
//  ProductsListModel.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Prasanth M Krishnadas on 2022-05-01.
//

import Foundation

// Holds response of response json with list of products
struct ProductsList: Codable {
    let products: [Product]
}
