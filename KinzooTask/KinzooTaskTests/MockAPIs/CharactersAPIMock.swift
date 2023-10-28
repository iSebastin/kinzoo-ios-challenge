//
//  CharacterAPIMock.swift
//  KinzooTaskUITests
//
//  Created by Victor Sebastian on 2023-10-27.
//

import Foundation

class CharactersAPIMock: CharacterServiceProtocol {
    weak var delegate: CharacterDelegate?
    
    func setViewDelegate(delegate: CharacterDelegate) {
        self.delegate = delegate
    }
    
    func getCharacters() {
        do {
            if let jsonData = JsonHelper().loadJson(filename: "MockCharactersAPI") {
                let decoder = JSONDecoder()
                let response = try decoder.decode(CharacterResponse.self, from: jsonData)
                self.delegate?.presentCharacters(with: .success(response.results))
            }
        } catch {
            self.delegate?.presentCharacters(with: .failure(error))
        }
    }
}
