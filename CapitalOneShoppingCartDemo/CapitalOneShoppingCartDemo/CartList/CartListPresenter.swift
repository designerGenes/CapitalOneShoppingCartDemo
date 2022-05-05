//
//  CartListPresenter.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import Combine

protocol CartListPresenterProtocol {
    var cartListPublisher: AnyPublisher<Void, Never> { get }
    func getCartProducts() -> [Product]
    func initiateCartProductList()
    func updateProductList()
    func productsCount() -> Int
    func getCurrentProduct(at index:Int) -> Product
    func getSubTotal() -> Int
    func getTaxes() -> Double
    func getTotal() -> Double
}

class CartListPresenter:CartListPresenterProtocol{
    
    //MARK: - Variables
    var cartListPublisher: AnyPublisher<Void, Never>
    private var updateCartListPublisher = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()
    private let interactor: CartListInteractorProtocol
    var products: [Product] = []
    var taxes = 5
    
    //MARK: - Initializer
    init(interactor: CartListInteractorProtocol) {
        self.interactor = interactor
        cartListPublisher = updateCartListPublisher.eraseToAnyPublisher()
    }
    
    //MARK: - Custom Methods
    /// Initiates the call to retreive the product list service
    func initiateCartProductList() {
        interactor.productList().sink { _ in
        } receiveValue: { [weak self] in
            self?.addProducts(products: $0)
        }
        .store(in: &cancellables)
    }

    
    func getCartProducts() -> [Product] {
        return products
    }
    
    func getSubTotal() -> Int {
        var price = 0
        for item in getCartProducts(){
            price = price + item.price
        }
        return price
    }
    
    func getTaxes() -> Double {
        return ((Double(getSubTotal()) * Double(taxes))/100)
    }
    
    func getTotal() ->  Double{
        return Double(getSubTotal()) + getTaxes()
    }
    
    func productsCount() -> Int {
        return self.products.count
    }
    
    func addProducts(products: [Product]){
        self.products = products
        //self.products = getCartProducts()
        updateCartListPublisher.send()

    }
    
    func updateProductList() {
        initiateCartProductList()
        self.products = getCartProducts()
        updateCartListPublisher.send()
    }

    func getCurrentProduct(at index:Int) -> Product {
        if self.products.count > index{
            return self.products[index]
        }
        return Product.emptyProduct
    }

}
