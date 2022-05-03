//
//  Endpoint.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Prasanth M Krishnadas on 2022-05-03.
//

import Foundation

class EndpointProvider {
    /// Provides endpoint url for productList
    static func productListendPoint() -> URL{
        
        guard let url = URL(string: "https://dummyjson.com/products") else {
            fatalError("Invalid Url")
        }
        
        return url
    }
}
