//
//  CartListInteractorTests.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Taha Ali on 2022-05-05.
//

import XCTest
import Combine
@testable import CapitalOneShoppingCartDemo

class CartListInteractorTests: XCTestCase {
    var interactor: MockCartListInteractor!
    var cancellable: AnyCancellable!

    override func setUpWithError() throws {
        interactor = MockCartListInteractor()
    }

    override func tearDownWithError() throws {
        interactor = nil
        cancellable = nil
    }
    
    func testProductListInteractor_WhenInitiliazed_CalledGetProducts() {
        _ = interactor.productList()
        XCTAssertTrue(interactor.productListCalled, "This should return true but returning false")
    }
    
    func testProductListInteractor_WhenCalled_ReturnProducts() {
        let publisher = interactor.productList()
        _ = publisher.sink { product in
            print(product.count)
        }
        XCTAssertNotNil(publisher)
    }

}
