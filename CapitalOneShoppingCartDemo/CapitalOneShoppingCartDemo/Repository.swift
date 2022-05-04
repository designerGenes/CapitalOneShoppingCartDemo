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
    func get(id: String) -> T?
    func set(record: T)
}

extension Repository {
    func getAll() -> [T] {
        return UserDefaults.standard.array(forKey: Self.storageKey) as? [T] ?? []
    }
}
