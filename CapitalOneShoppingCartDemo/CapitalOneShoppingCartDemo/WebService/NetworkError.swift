//
//  Error.swift
//  CapitalOneShoppingCartDemo
//
//  Created by Prasanth M Krishnadas on 2022-05-03.
//

import Foundation

enum NetworkError : LocalizedError, Equatable, Error {
    
    case responseModelParsingError
    case invalidRequestURLStringError
    
    
    var errorDescription: String? {
        switch self {
        case .invalidRequestURLStringError, .responseModelParsingError:
            return ""
        }
    }
}
