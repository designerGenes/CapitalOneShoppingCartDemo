//
//  Store.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Prasanth M Krishnadas on 2022-05-09.
//

import Foundation

struct AppState{
    var id: Int
    var cart: Cart
}

enum Action {
    case add
    case remove
}

class ProductReducer {
    func updateCartProduct(productState:inout AppState, productAction: Action){
        switch productAction {
        case .add:
            let repo = CartsRepository()
            let cart = repo.getCart()
            cart.addProduct(id: productState.id)
            productState.cart = cart
            //add product
        case .remove:
            let repo = CartsRepository()
            let cart = repo.getCart()
            cart.removeProduct(id: productState.id)
            productState.cart = cart

            // remove product
        }
    }
}

class Store:ObservableObject {
    
    var reducer: ProductReducer
    @Published var appState: AppState?
    static let shared = Store(reducer: ProductReducer(), state:nil)

    func dispatch(action:Action, appState: inout AppState){
        reducer.updateCartProduct(productState: &appState, productAction: action)
    }
    init(reducer: ProductReducer, state: AppState?){
        self.reducer = reducer
        self.appState = state
    }
}



