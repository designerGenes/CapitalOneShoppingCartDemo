//
//  ProductsWebService.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//  Updated By Prasanth M Krishnadas 2022-04-30

import Foundation
import Combine

protocol ProductWebserviceProtocol{
    func getListOfProducts()->AnyPublisher<[Product]?, Error>
}

class ProductsWebService:ProductWebserviceProtocol{
    
    private let networkClient:NetworkClientProtocol
    
    init(networkClient:NetworkClientProtocol = NetworkClient()){
        self.networkClient = networkClient
    }
    
    
    func getListOfProducts() -> AnyPublisher<[Product]?, Error> {
        //Todo:Endpoint
        guard let url = URL(string: "https://dummyjson.com/products") else {
            fatalError("Invalid Url")
        }
        return networkClient.getResponseData(fromUrl: url, type: ProductsList.self)
            .map{$0?.products }
            .receive(on: RunLoop.main, options: nil)
            .eraseToAnyPublisher()
    }
    
 
    func getProductList() -> AnyPublisher<[Product], Error> {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            fatalError("Invalid Url")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url).map { $0.data}.print()
            .decode(type: ProductsList.self, decoder: JSONDecoder())
            .map{$0.products}
            .receive(on: RunLoop.main, options: nil)
            .eraseToAnyPublisher()
        
    }
}
