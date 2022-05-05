//
//  CartListPresenterTests.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Taha Ali on 2022-05-05.
//

import XCTest
import Combine
@testable import CapitalOneShoppingCartDemo

class CartListPresenterTests: XCTestCase {
    
    var interactor: MockCartListInteractor!
    var presenter: MockCartListPresenter!
    private var expectation: XCTestExpectation!
    private var cancellable: AnyCancellable!
    private var productsTotal: Double!
    private var productsSubTotal: Int!
    
    
    override func setUpWithError() throws {
        interactor =  MockCartListInteractor()
        presenter = MockCartListPresenter()
        expectation = expectation(description: "wait for publisher")
        productsSubTotal = 2000
        productsTotal = Double(2260)
    }
    
    override func tearDownWithError() throws {
        interactor = nil
        presenter = nil
        expectation = nil
        productsTotal = nil
    }
    
    // helper function that makes an expectation wait for 8 seconds
    private func expectationWait() {
        wait(for: [expectation], timeout: 8)
    }
    
    func testCartListPresenter_initiateProductListCalled() {
        var productListUpdated = false
        cancellable = presenter.cartListPublisher.sink {
            productListUpdated = true
            self.expectation.fulfill()
        }
        
        presenter.initiateCartProductList()
        
        expectationWait()
        
        XCTAssertTrue(productListUpdated, "When initiateProductList called productsListPublisher should be called")
    }
    
    func testCartListPresenter_initiateProductListCalled_ReturnProducts() {
        
        presenter.products = [Product.defaultProduct]
        
        cancellable = presenter.cartListPublisher.sink {
            self.expectation.fulfill()
        }
        
        presenter.initiateCartProductList()
        
        expectationWait()
        XCTAssertNotNil(presenter.getCartProducts(), "getAllProducts should return value but not returning any product")
    }
    
    func testCartListPresenter_initiateProductListCalled_ReturnCountGreaterThanZero() {
        
        presenter.products = [Product.defaultProduct]
        cancellable = presenter.cartListPublisher.sink {
            self.expectation.fulfill()
        }
        
        presenter.initiateCartProductList()
        
        expectationWait()
        XCTAssertEqual(presenter.productsCount(), 1,"It should return the count 1 but returning other than 1")
    }
    
    func testCartListPresenter_initiateProductListCalled_ReturnSubTotal() {
        
        presenter.products = [Product.defaultProduct, Product.defaultProduct ]
        cancellable = presenter.cartListPublisher.sink {
            self.expectation.fulfill()
        }
        
        presenter.initiateCartProductList()
        
        expectationWait()
        XCTAssertEqual(presenter.getSubTotal(), productsSubTotal,"It should return the count 1 but returning other than 1")
    }
    
    func testCartListPresenter_initiateProductListCalled_ReturnTotal() {
        
        presenter.products = [Product.defaultProduct,
                              Product.defaultProduct ]
        cancellable = presenter.cartListPublisher.sink {
            self.expectation.fulfill()
        }
        
        presenter.initiateCartProductList()
        
        expectationWait()
        XCTAssertEqual(presenter.getTotal(), productsTotal,"It should return the count 1 but returning other than 1")
    }
}
