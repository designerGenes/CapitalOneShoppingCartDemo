//
//  Repository.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Jaden Nation on 5/2/22.
//

import Foundation

protocol Repository {
    associatedtype T: DataModel
    
    func getAll() -> [T]
    func get(recordId: String) -> T?
    func set(record: T) -> Bool
}

extension Repository {
    var archiveID: String {
        "\(String(describing: self))_id"
    }
    var createdIds: [String] {
        let createdIds = UserDefaults.standard.array(forKey: self.archiveID) as? [String]
        return createdIds ?? [String]()
    }
    
    func set(record: T) -> Bool {
        guard let id = record.id else { return false }
        UserDefaults.standard.set(record, forKey: id)
        return true
    }
    
    func get(recordId: String) -> T? {
        UserDefaults.standard.object(forKey: recordId) as? T
    }
    
    func getAll() -> [T] {
        var allRecords = [T]()
        for createdId in self.createdIds {
            guard let retrievedRecord = self.get(recordId: createdId) else {
                continue
            }
            allRecords.append(retrievedRecord)
        }
        return allRecords
    }
}
