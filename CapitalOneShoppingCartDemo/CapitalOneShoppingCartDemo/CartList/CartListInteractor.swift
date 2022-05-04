//
//  CartListInteractor.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Taha Ali on 2022-04-29.
//

import Foundation
import Combine

///  Responsible for receiving an input, perform an operation using that input and comunicating the output of that operation.
protocol CartListInteractorProtocol{
    func productList() -> [Cart]
}
/// Responsible to obtain the productlist form webservice and return the values to presenter.
class CartListInteractor:CartListInteractorProtocol{
    
    let repository: CartsRepository
    
    init (repository: CartsRepository) {
      self.repository = repository
    }
    
    /// Called by  presenter to retreive the list of products
    /// Returns the produts-array/Error to presenter
    func productList() -> [Cart] {
        return self.repository.getAll()
    }


}
