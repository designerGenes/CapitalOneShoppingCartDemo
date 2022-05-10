//
//  Store.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Prasanth M Krishnadas on 2022-05-09.
//

import Foundation
import Combine

struct AppState{
    var counter: Int = 0
    
}

enum Action {
    case add
    case remove
    case clear
}

class Reducer {
    
    func updateCartProduct(appState:inout AppState, action: Action){
        switch action {
        case .add:
            print("add product")
            if appState.counter >= 0{
                appState.counter += 1
                Store.shared.storePassthroughSubject.send(appState.counter)
            }
            
        case .remove:
            print("remove product")
            if appState.counter >= 0{
                appState.counter -= 1
                Store.shared.storePassthroughSubject.send(appState.counter)
            }
        case .clear:
            print("Clear products")
            appState.counter = 0
            Store.shared.storePassthroughSubject.send(appState.counter)
        }
    }
}

class Store: ObservableObject {
    
    var reducer: Reducer = Reducer()
    @Published var appState: AppState = AppState(counter: CartsRepository().getCart().productIds.count)
    
    static let shared = Store()
    
    let storePassthroughSubject = PassthroughSubject<Int,Never>()

    
    func dispatch(action: Action){
        reducer.updateCartProduct(appState: &appState, action: action)
    }
    
}

