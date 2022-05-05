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
    func productList() -> AnyPublisher<[Product], Never>
}
/// Responsible to obtain the productlist form webservice and return the values to presenter.
class CartListInteractor:CartListInteractorProtocol{
    //MARK: - Variables
    let repository: CartsRepository

    //MARK: - Initializer
    init (repository: CartsRepository) {
      self.repository = repository
    }
    
    //MARK: - Custom Methods
    /// Called by  repository to retreive the list of products
    /// Returns the produts-array/Error to presenter
    func productList() -> AnyPublisher<[Product], Never>{
        //}-> [Product] {
        return self.repository.getAllProductsInCart()
            .receive(on: RunLoop.main,options: nil)
          .eraseToAnyPublisher()

    }


}
