//
//  ProductListPresenterTests.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Taha Ali on 2022-05-04.
//

import XCTest
import Combine
@testable import CapitalOneShoppingCartDemo

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
    
    func testProductListPresenter_initiateProductListCalled_ReturnProducts() {
        
        presenter.listOfProducts = [Product.emptyProduct]
        
        cancellable = presenter.productsListPublisher.sink {
            self.expectation.fulfill()
        }
        
        presenter.initiateProductList()
        
        
        expectationWait()
        XCTAssertNotNil(presenter.getAllProducts, "getAllProducts should return value but not returning any product")
    }
    
    func testProductListPresenter_initiateProductListCalled_ReturnCountGreaterThanZero() {
        
        presenter.listOfProducts = [Product.emptyProduct]
        cancellable = presenter.productsListPublisher.sink {
            self.expectation.fulfill()
        }
        
        presenter.initiateProductList()
        
        expectationWait()
        XCTAssertEqual(presenter.productsCount(), 1,"It should return the count 1 but returning other than 1")
    }
    
    func testProductListPresenter_initiateProductListCalled_ReturnProductAtGivenIndex() {
        
        let testProduct = Product.emptyProduct
        presenter.listOfProducts = [testProduct]
        cancellable = presenter.productsListPublisher.sink {
            self.expectation.fulfill()
        }
        
        presenter.initiateProductList()
        
        expectationWait()
        XCTAssertEqual(presenter.getCurrentProduct(at: 0), testProduct,"It should return the specific product")
    }
    
    func testProductListPresenter_initiateProductListCalled_IfProductAvailableinCart_ReturnTrue() {
        
        let testProduct = Product.defaultProduct
        presenter.listOfProducts = [testProduct]
        cancellable = presenter.productsListPublisher.sink {
            self.expectation.fulfill()
        }
        
        presenter.initiateProductList()
        
        ProductsRepository().set(records: presenter.listOfProducts)
        let isProductAvailable = presenter.productIsAvailableInCart(productId: testProduct.id)
        
        expectationWait()
        
        XCTAssertTrue(isProductAvailable,"It should return true but its returning false")
    }
    
    func testProductListPresenter_initiateProductListCalled_IfProductIsNotAvailableinCart_ReturnFalse() {
        
        let testProduct = Product.defaultProduct
        presenter.listOfProducts = [testProduct]
        cancellable = presenter.productsListPublisher.sink {
            self.expectation.fulfill()
        }
        
        presenter.initiateProductList()
        
        ProductsRepository().set(records: presenter.listOfProducts)
        let isProductAvailable = presenter.productIsAvailableInCart(productId: 9)
        
        expectationWait()
        
        XCTAssertFalse(isProductAvailable,"It should return false but its returning true")
    }

}
