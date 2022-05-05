//
//  ProductListInteractorTests.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Taha Ali on 2022-05-04.
//

import XCTest
import Combine
@testable import CapitalOneShoppingCartDemo

class ProductListInteractorTests: XCTestCase {
    
    var mockWebService: MockWebService!
    var interactor: MockProductListInteractor!
    var cancellable: AnyCancellable!

    override func setUpWithError() throws {
        mockWebService = MockWebService()
        interactor = MockProductListInteractor()
    }

    override func tearDownWithError() throws {
        mockWebService = nil
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
            print(product?.count)
        }
        
        XCTAssertNotNil(publisher)
    }

}
