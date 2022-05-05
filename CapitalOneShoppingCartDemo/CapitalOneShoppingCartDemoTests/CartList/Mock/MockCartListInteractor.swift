//
//  MockCartListInteractor.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Taha Ali on 2022-05-05.
//

import Foundation
import Combine
@testable import CapitalOneShoppingCartDemo

class MockCartListInteractor: CartListInteractorProtocol{
    
    var productListCalled: Bool = false
    var listOfProducts: [Product]?
    
    
    func productList() -> AnyPublisher<[Product], Never> {
        productListCalled = true
        let product = Product.defaultProduct
        
        listOfProducts = [product]
        return Just(listOfProducts!).eraseToAnyPublisher()
    }
}
