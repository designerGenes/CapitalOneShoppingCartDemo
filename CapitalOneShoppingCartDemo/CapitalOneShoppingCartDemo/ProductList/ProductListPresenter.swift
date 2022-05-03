//
//  ProductListPresenter.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import Combine
import UIKit

protocol ProductListPresenterProtocol: AnyObject{
    func initiateProductList()
}

class ProductListPresenter:ProductListPresenterProtocol{
    
    private let productListInteractorProtocol:ProductListInteractorProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    init(interactorProtocol:ProductListInteractorProtocol){
        self.productListInteractorProtocol = interactorProtocol
    }
    
    func initiateProductList() {
        productListInteractorProtocol.productList()
            .sink { Error in
                print(Error)
            } receiveValue: {
                print("Product List")
                print($0!)
            }
            .store(in: &cancellables)
    }
    
}
