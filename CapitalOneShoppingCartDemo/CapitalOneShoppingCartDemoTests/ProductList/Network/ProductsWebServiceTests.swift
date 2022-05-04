//
//  ProductsWebServiceTests.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Prasanth M Krishnadas on 2022-05-03.
//

import XCTest
import Combine
@testable import CapitalOneShoppingCartDemo


class NetworkClientMock:NetworkClientProtocol{
    
    var dataResult: Decodable?
    
    func getResponseData<T: Decodable>(fromUrl: URL, type:T.Type) -> AnyPublisher<T?,Never> {

        return Just(dataResult as? T)
            .eraseToAnyPublisher()
    }
    
}

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
        cancellable =  productWebService.getListOfProducts()
            .sink{ _ in} receiveValue: { products in
                actualResult = products
                self.expectation.fulfill()
            }
        expectationWait()
        
        XCTAssertEqual(expectedResult,actualResult,"Error")
        
    }
    
    func testGetListOfProducts_WhenProvideValidUrl_EmptyArray(){
        
    }
    
    //
    
    
    //    func testExample() throws {
    //        // This is an example of a functional test case.
    //        // Use XCTAssert and related functions to verify your tests produce the correct results.
    //        // Any test you write for XCTest can be annotated as throws and async.
    //        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
    //        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    //    }
    //
    //    func testPerformanceExample() throws {
    //        // This is an example of a performance test case.
    //        self.measure {
    //            // Put the code you want to measure the time of here.
    //        }
    //    }
    
}
