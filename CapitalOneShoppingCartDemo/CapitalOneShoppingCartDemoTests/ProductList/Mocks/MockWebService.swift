//
//  MockWebService.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Taha Ali on 2022-05-04.
//

import Foundation
import Combine
@testable import CapitalOneShoppingCartDemo

class MockWebService: ProductWebserviceProtocol {
    
    var getListOfProductsCalled: Bool = false
    var listOfProducts: [Product]?
    
    func getListOfProducts(fromUrl: URL) -> AnyPublisher<[Product]?, Never> {
        getListOfProductsCalled = true
        return Just(listOfProducts).eraseToAnyPublisher()
    }
}
