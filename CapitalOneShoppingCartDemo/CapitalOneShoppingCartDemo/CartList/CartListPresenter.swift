//
//  CartListPresenter.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import Combine

protocol CartListPresenterProtocol {
    func getCartProducts() -> [Product]
    func initiateCartProductList()

}

class CartListPresenter:CartListPresenterProtocol{

    private let interactor: CartListInteractor
    var products: [Product] = []
    
    init(interactor: CartListInteractor) {
        self.interactor = interactor
    }
    
    /// Initiates the call to retreive the product list service
func initiateCartProductList() {
        products = interactor.productList()
    }

    
    func getCartProducts() -> [Product] {
        return products
    }

}
