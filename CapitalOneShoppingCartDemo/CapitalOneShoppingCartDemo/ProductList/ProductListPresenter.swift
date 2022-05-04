//
//  ProductListPresenter.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import Combine
import UIKit


protocol ProductListPresenterProtocol {
    var productsListPublisher: AnyPublisher<Void, Never> { get }
    func initiateProductList()
    func getAllProducts() -> [Product]
    func productsCount() -> Int
    func getCurrentProduct(at index:Int) -> Product
}

// Implements the data conversion to presentable format to view
class ProductListPresenter: ProductListPresenterProtocol {
    var productsListPublisher: AnyPublisher<Void, Never>
    private var updateProductsListPublisher = PassthroughSubject<Void, Never>()
    private let productListInteractor: ProductListInteractorProtocol
    private var cancellables = Set<AnyCancellable>()
    private var products : [Product] = []
    
    required init(interactor:ProductListInteractorProtocol){
        self.productListInteractor = interactor
        productsListPublisher = updateProductsListPublisher.eraseToAnyPublisher()
    }
    
    /// Initiates the call to retreive the product list service
    func initiateProductList() {
        productListInteractor.productList()
            .sink ( receiveValue: { [weak self] in
                print("Product List")
                self?.updateProductList(products: $0 ?? [])
            })
    }
    
    func productsCount() -> Int {
        return self.products.count
    }
    
    func getAllProducts() -> [Product] {
        return self.products
    }
    
    private func updateProductList(products: [Product]) {
        self.products = products
        updateProductsListPublisher.send()
    }
    
    func getCurrentProduct(at index:Int) -> Product {
        return self.products[index]
    }
}
