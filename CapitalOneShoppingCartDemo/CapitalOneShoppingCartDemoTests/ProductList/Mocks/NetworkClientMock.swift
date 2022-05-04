//
//  NetworkClientMock.swift
//  CapitalOneShoppingCartDemoTests
//
//  Created by Taha Ali on 2022-05-04.
//

import Foundation
import Combine
@testable import CapitalOneShoppingCartDemo

class NetworkClientMock:NetworkClientProtocol{
    
    var dataResult: Decodable?
    
    func getResponseData<T: Decodable>(fromUrl: URL, type:T.Type) -> AnyPublisher<T?,Never> {

        return Just(dataResult as? T)
            .eraseToAnyPublisher()
    }
}
