//
//  Repository.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Jaden Nation on 5/2/22.
//

import Foundation

protocol Repository {
    associatedtype T
    static var storageKey: String { get }
    func getAll() -> [T]
    func get(id: Int) -> T?
    func set(record: T)
}

extension Repository {
    func getAll() -> [T] {
         let decodedObject = UserDefaults.standard.array(forKey: Self.storageKey) as! Data
        guard let decodedData = try PropertyListDecoder().decode(Cart.self, from: decodedObject) as! [T] else {
            return nil
        }
        return decodedObject
       
       // return UserDefaults.standard.array(forKey: Self.storageKey) as? [T] ?? []
    }
}
