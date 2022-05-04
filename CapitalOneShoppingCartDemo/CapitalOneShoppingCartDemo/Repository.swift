//
//  Repository.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Jaden Nation on 5/2/22.
//

import Foundation

protocol Repository {
    associatedtype T: Codable
    static var storageKey: String { get }
    func getAll() -> [T]
    func get(id: Int) -> T?
    func set(record: T)
}

extension Repository {
    func getAll() -> [T] {
        let savedArray = UserDefaults.standard.array(forKey: Self.storageKey) ?? []
        if let typedArray = savedArray as? [T] {
            return typedArray
        } else if let dataArray = savedArray as? [Data] {
            let decoder = PropertyListDecoder()
            let decodedArray = dataArray.map({ try? decoder.decode(T.self, from: $0 ) })
            return (decodedArray as? [T]) ?? []
        }
        
        return []
    }
}
