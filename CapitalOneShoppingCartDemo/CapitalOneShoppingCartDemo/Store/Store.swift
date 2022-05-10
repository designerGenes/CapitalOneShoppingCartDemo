//
//  Store.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Prasanth M Krishnadas on 2022-05-09.
//

import Foundation

struct AppState{
    var counter: Int = 0
    
}

enum Action {
    case add
    case remove
}

class Reducer {
    
    func updateCartProduct(appState:inout AppState, action: Action){
        switch action {
        case .add:
            print("add product")
            if appState.counter >= 0{
                appState.counter += 1
            }
        case .remove:
            print("remove product")
            if appState.counter >= 0{
                appState.counter -= 1
            }
        }
    }
}

class Store: ObservableObject {
    
    var reducer: Reducer = Reducer()
    @Published var appState: AppState = AppState(counter: Cart().productIds.count)
    
    static let shared = Store()
    
//    init(appState:AppState, reducer:Reducer){
//        self.reducer = reducer
//        self.appState = appState
//    }
    
    func dispatch(action: Action){
        reducer.updateCartProduct(appState: &appState, action: action)
    }
    
}

