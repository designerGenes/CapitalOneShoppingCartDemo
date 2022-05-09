//
//  Store.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Prasanth M Krishnadas on 2022-05-09.
//

import Foundation

struct ProductState{
    var cart: Cart
}

enum ProductAction {
    case add
    case remove
}

class ProductReducer {
    func updateCartProduct(productState: ProductState, productAction: ProductAction){
        switch productAction {
        case .add:
            //add product
        case .remove:
            // remove product
        }
    }
}

class Store: ObservableObject {
    
    var reducer: ProductReducer
    @Published var appState: ProductState
    
    init(appState:ProductState, reducer:ProductReducer){
        self.reducer = reducer
        self.appState = appState
    }
}
