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

    var productsListPublisher: AnyPublisher<Void, Never> = Result.Publisher(()).eraseToAnyPublisher()
    var cancellables: AnyCancellable?
    
    var initiateProductListCalled: Bool = false
    var listOfProducts: [Product] = []
    
    func initiateProductList() {
        initiateProductListCalled = true
        cancellables = productsListPublisher.sink(receiveValue: { _ in
            print("Test")
        })
    }
    
    func productIsAvailableInCart(productId: Int) -> Bool {
        if productId == 10  {
            return true
        }
        return false
    }
    
    func getAllProducts() -> [Product] {
        return listOfProducts
    }
    
    func productsCount() -> Int {
        return listOfProducts.count
    }
    
    func getCurrentProduct(at index: Int) -> Product {
        return listOfProducts[index]
    }
    
}
