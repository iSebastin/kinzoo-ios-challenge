//
//  APIEndpoints.swift
//  KinzooTask
//
//  Created by Victor Sebastian on 2023-10-27.
//

import Foundation

protocol URLEndpoint {
    var path: String { get }
}

enum APIEndpoint: URLEndpoint {
    case getCharacters
    
    var path: String {
        switch self {
        case .getCharacters:
            return "https://rickandmortyapi.com/api/character?page=1"
        }
    }
}
