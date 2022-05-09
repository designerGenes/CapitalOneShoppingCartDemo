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
    func productIsAvailableInCart(productId: Int) -> Bool
}

// Implements the data conversion to presentable format to view
class ProductListPresenter: ProductListPresenterProtocol {
    var productsListPublisher: AnyPublisher<Void, Never>
    private var updateProductsListPublisher = PassthroughSubject<Void, Never>()
    private let productListInteractor: ProductListInteractorProtocol
    private var cancellables = Set<AnyCancellable>()
    @Published private var products : [Product] = []
    
    required init(interactor:ProductListInteractorProtocol){
        self.productListInteractor = interactor
        productsListPublisher = updateProductsListPublisher.eraseToAnyPublisher()
    }
    
    /// Initiates the call to retreive the product list service
    func initiateProductList() {
        //Showing Progress
        ProgressView.shared.startAnimating()

        productListInteractor.productList().sink(receiveCompletion: { _ in
        }, receiveValue: { [weak self] in
            //Stop the progress
            ProgressView.shared.stopAnimatimating()

            self?.updateProductList(products: $0 ?? [])
            ProductsRepository().set(records: $0 ?? [])
        })
        .store(in: &cancellables)
    }
    
    func productsCount() -> Int {
        return self.products.count
    }
    
    func getAllProducts() -> [Product] {
        return self.products
    }
    
    func productIsAvailableInCart(productId: Int) -> Bool{
        let cartRepository = CartsRepository()
        if cartRepository.getCart().productIds.count > 0 {
            if cartRepository.getCart().productIds.contains(productId){
                return true
            }
        }
//        if ((Store.shared.appState?.cart.productIds.contains(productId)) != nil){
//            return true
//        }
        return false
    }
    
    private func updateProductList(products: [Product]) {
        self.products = products
        updateProductsListPublisher.send()
    }
    
    func getCurrentProduct(at index:Int) -> Product {
        return self.products[index]
    }
}
