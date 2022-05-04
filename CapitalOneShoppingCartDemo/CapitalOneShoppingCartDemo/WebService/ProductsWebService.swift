//
//  ProductsWebService.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//  Updated By Prasanth M Krishnadas 2022-04-30

import Foundation
import Combine

protocol ProductWebserviceProtocol{
    func getListOfProducts()->AnyPublisher<[Product]?, Never>
}

class ProductsWebService:ProductWebserviceProtocol{
    
    private let networkClient:NetworkClientProtocol
    
    init(networkClient:NetworkClientProtocol = NetworkClient()){
        self.networkClient = networkClient
    }
    
    
    /// Downloads and returns the array of products from endpoint or returns error message
    func getListOfProducts() -> AnyPublisher<[Product]?, Never> {
        
        return networkClient.getResponseData(fromUrl: EndpointProvider.productListendPoint(), type: ProductsList.self)
            .map{$0?.products}
            .print()
            .receive(on: RunLoop.main, options: nil)
            .eraseToAnyPublisher()
        
        
        
    }

}
