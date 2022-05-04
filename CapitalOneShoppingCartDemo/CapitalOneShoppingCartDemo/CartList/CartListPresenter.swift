//
//  CartListPresenter.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import Combine

protocol CartListPresenterProtocol {
    var productsListPublisher: AnyPublisher<Void, Never> { get }
    func initiateProductList()
    func getAllProducts() -> [Product]
    func productsCount() -> Int
    func getCurrentProduct(at index:Int) -> Product
}

class CartListPresenter{
    private let interactor: CartListInteractor
    
    var cart: [Cart] = []
    
    init(interactor: CartListInteractor) {
        self.interactor = interactor
        cart = interactor.repository.getAll()
    }

}
