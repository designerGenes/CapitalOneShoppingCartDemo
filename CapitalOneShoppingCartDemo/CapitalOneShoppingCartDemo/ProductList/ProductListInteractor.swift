//
//  ProductListInteractor.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import Combine

protocol ProductListInteractorProtocol{
    func productList() -> AnyPublisher<[Product]?, Error>
}


class ProductListInteractor:ProductListInteractorProtocol{

  
    private let productWebServiceProtocol: ProductWebserviceProtocol
    
    init(webServiceProtocol: ProductWebserviceProtocol){
        self.productWebServiceProtocol = webServiceProtocol
    }

    func productList() -> AnyPublisher<[Product]?, Error> {
        productWebServiceProtocol.getListOfProducts()
            .receive(on: RunLoop.main, options: nil)
            .eraseToAnyPublisher()
    }
    
}
