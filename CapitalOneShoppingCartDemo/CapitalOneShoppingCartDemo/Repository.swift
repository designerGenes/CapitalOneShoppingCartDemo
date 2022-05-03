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

//extension Repository {
//    var archiveID: String {
//        "\(String(describing: self))_id"
//    }
//    var createdIds: [String] {
//        let createdIds = UserDefaults.standard.array(forKey: self.archiveID) as? [String]
//        return createdIds ?? [String]()
//    }
//    
//    func set(record: T, id: String) -> Bool {
//        UserDefaults.standard.set(record, forKey: id)
//        return true
//    }
//    
//    func get(id: String) -> T? {
//        UserDefaults.standard.object(forKey: id) as? T
//    }
//    
//    func getAll() -> [T] {
//        var allRecords = [T]()
//        for createdId in self.createdIds {
//            guard let retrievedRecord = self.get(id: createdId) else {
//                continue
//            }
//            allRecords.append(retrievedRecord)
//        }
//        return allRecords
//    }
//}
