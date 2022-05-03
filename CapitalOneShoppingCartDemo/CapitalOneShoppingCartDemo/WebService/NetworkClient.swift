//
//  NetworkClient.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Prasanth M Krishnadas on 2022-05-02.
//

import Foundation
import Combine

protocol NetworkClientProtocol {
    func getResponseData<T: Decodable>(fromUrl: URL, type:T.Type) -> AnyPublisher<T?,Error>
}

class NetworkClient: NetworkClientProtocol{
    
    /// Returns the data of type requested by webservice layer if successful
    /// Else returns error message
    func getResponseData<T: Decodable>(fromUrl: URL, type:T.Type) -> AnyPublisher<T?,Error>{
        return URLSession.shared.dataTaskPublisher(for: fromUrl)
            .map{$0.data}
            .decode(type: T.self, decoder: JSONDecoder())
            .map{$0}
            .receive(on: RunLoop.main, options: nil)
            .eraseToAnyPublisher()
    }
}


//protocol NetworkClientProtocol {
//    //Todo Endpoint url to pass
//    func getData<D: Decodable>(url: URL)-> AnyPublisher<D?, URLError>
//}
//
//class NetworkClient: NetworkClientProtocol{
//    func getData<D>(url: URL) -> AnyPublisher<D?, URLError> where D : Decodable {
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data as? D}
//            .receive(on: RunLoop.main, options: nil)
//            .eraseToAnyPublisher()
//    }
//}
