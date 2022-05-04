//
//  MockProductListPresenter.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Taha Ali on 2022-05-04.
//

import Foundation
import Combine
@testable import CapitalOneShoppingCartDemo

class MockProductListPresenter: ProductListPresenterProtocol {
    var productsListPublisher: AnyPublisher<Void, Never>
    
    func initiateProductList() {
        //
    }
    
    func getAllProducts() -> [Product] {
        //
    }
    
    func productsCount() -> Int {
        //
    }
    
    func getCurrentProduct(at index: Int) -> Product {
        //
    }
    
    
}
