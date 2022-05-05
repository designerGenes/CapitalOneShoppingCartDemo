//
//  ProductListPresenterTests.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Taha Ali on 2022-05-04.
//

import XCTest
import Combine

class ProductListPresenterTests: XCTestCase {
    
    var interactor: MockProductListInteractor!
    var presenter: MockProductListPresenter!
    private var expectation: XCTestExpectation!
    private var cancellable: AnyCancellable!

    override func setUpWithError() throws {
        interactor = MockProductListInteractor()
        presenter = MockProductListPresenter()
        expectation = expectation(description: "wait for publisher")
    }

    override func tearDownWithError() throws {
        interactor = nil
        presenter = nil
        expectation = nil
    }
    // helper function that makes an expectation wait for 8 seconds
    private func expectationWait() {
        wait(for: [expectation], timeout: 8)
    }
    
    func testProductListPresenter_initiateProductListCalled() {
        var productListUpdated = false
        
        cancellable = presenter.productsListPublisher.sink {
            productListUpdated = true
            self.expectation.fulfill()
        }
        
        presenter.initiateProductList()
        
        expectationWait()
        XCTAssertTrue(productListUpdated, "When initiateProductList called productsListPublisher should be called")
    }

}
