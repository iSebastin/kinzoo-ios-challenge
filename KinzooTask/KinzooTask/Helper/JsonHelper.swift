//
//  File.swift
//  KinzooTaskUITests
//
//  Created by Victor Sebastian on 2023-10-27.
//

import Foundation

class JsonHelper {
    func loadJson(filename fileName: String) -> Data? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                return data
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
