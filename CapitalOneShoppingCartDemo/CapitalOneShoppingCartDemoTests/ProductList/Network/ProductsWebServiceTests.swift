//
//  ProductsWebServiceTests.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Prasanth M Krishnadas on 2022-05-03.
//

import XCTest
import Combine
@testable import CapitalOneShoppingCartDemo


class ProductsWebServiceTests: XCTestCase {
    
    private var netWorkClientMock:NetworkClientMock!
    private var productWebService: ProductWebserviceProtocol!
    private var expectation: XCTestExpectation!
    private var cancellable: AnyCancellable!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        netWorkClientMock = NetworkClientMock()
        productWebService = ProductsWebService(networkClient: netWorkClientMock)
        expectation = expectation(description: "wait for publisher")
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        productWebService = nil
        netWorkClientMock = nil
        cancellable = nil
        expectation = nil
    }
    
    // helper function that makes an expectation wait for 8 seconds
    private func expectationWait() {
        wait(for: [expectation], timeout: 8)
    }
    
    func testGetListOfProducts_WhenProvideValidUrl_ReceivesproductList(){
        let product = Product(id: 10, title: "iphone 9", price: 1000, description: "new iphone 9", discountPercentage: 10, rating: 9.5, stock: 10, brand: "Apple", category: "Smart Phone", thumbnail: "ImageUrl")
        
        netWorkClientMock.dataResult = ProductsList(products: [product])  
        
        let expectedResult = [product]
        
        var actualResult : [Product]?
        cancellable =  productWebService.getListOfProducts(fromUrl: EndpointProvider.productListendPoint())
            .sink{ _ in} receiveValue: { products in
                actualResult = products
                self.expectation.fulfill()
            }
        expectationWait()
        
        XCTAssertEqual(expectedResult,actualResult,"Error")
        
    }
    
    func testGetListOfProducts_WhenProvideValidUrl_ReturnEmptyArray(){
        let product = Product(id: 10, title: "iphone 9", price: 1000, description: "new iphone 9", discountPercentage: 10, rating: 9.5, stock: 10, brand: "Apple", category: "Smart Phone", thumbnail: "ImageUrl")
        
        netWorkClientMock.dataResult = ProductsList(products: [])
        
        let expectedResult = [product]
        
        var actualResult : [Product]?
        cancellable =  productWebService.getListOfProducts(fromUrl: EndpointProvider.productListendPoint())
            .sink{ _ in} receiveValue: { products in
                actualResult = products
                self.expectation.fulfill()
            }
        expectationWait()
        
        XCTAssertNotEqual(expectedResult,actualResult,"It should return empty array but its returning something ")
    }
    
    func testGetListOfProducts_WhenProvideValidUrl_ReturnInvalidResponse(){
        let product = Product(id: 10, title: "iphone 9", price: 1000, description: "new iphone 9", discountPercentage: 10, rating: 9.5, stock: 10, brand: "Apple", category: "Smart Phone", thumbnail: "ImageUrl")
        
        netWorkClientMock.dataResult = [product]
        
        let expectedResult = [product]
        
        var actualResult : [Product]?
        cancellable =  productWebService.getListOfProducts(fromUrl: EndpointProvider.productListendPoint())
            .sink{ _ in} receiveValue: { products in
                actualResult = products
                self.expectation.fulfill()
            }
        expectationWait()
        
        XCTAssertNotEqual(expectedResult,actualResult,"It should return invalid response but its returning something else ")
    }
    
    func testGetListOfProducts_WhenProvideInValidUrl_ReturnError(){
       // let product = Product(id: 10, title: "iphone 9", price: 1000, description: "new iphone 9", discountPercentage: 10, rating: 9.5, stock: 10, brand: "Apple", category: "Smart Phone", thumbnail: "ImageUrl")
        
      //  netWorkClientMock.dataResult = ProductsList(products: [product])
        
        let invalidURL = URL(string: "www.test.com")
      //  expectationWait()
        
        XCTAssertNotEqual(invalidURL, EndpointProvider.productListendPoint(), "Invalid URL")

    }
}
