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

// Implements the data conversion to presentable format to view
class ProductListPresenter:ProductListPresenterProtocol{
    
    private let productListInteractor:ProductListInteractorProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    private var products = [Product]()
    
    init(interactor:ProductListInteractorProtocol){
        self.productListInteractor = interactor
    }
    
    /// Initiates the call to retreive the product list service
    func initiateProductList() {
        productListInteractor.productList()
            .sink { Error in
                print(Error)
            } receiveValue: { [weak self] in
                print("Product List")
                print($0!)
                self?.products = $0 ?? []
            }
            .store(in: &cancellables)
    }
    
    
    
}
