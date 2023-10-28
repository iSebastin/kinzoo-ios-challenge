//
//  UserDefaultHelper.swift
//  KinzooTaskTests
//
//  Created by Victor Sebastian on 2023-10-27.
//

import Foundation

enum UserDefaultKeys: String{
    case characterData = "CharacterData"
}

class UserDefaultHelper {
    
    static func save(object: Codable, for key: UserDefaultKeys) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(object)
            UserDefaults.standard.set(data, forKey: key.rawValue)
        } catch {
            print("Unable to Encode Note (\(error))")
        }
    }
    
    static func retreiveObject<T: Codable>(for key: UserDefaultKeys, type: T.Type) -> T? {
        if let data = UserDefaults.standard.data(forKey: key.rawValue) {
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(T.self, from: data)
                return response
            } catch {
                print("Unable to Decode Note (\(error))")
            }
        }
        return nil
    }
    
}

