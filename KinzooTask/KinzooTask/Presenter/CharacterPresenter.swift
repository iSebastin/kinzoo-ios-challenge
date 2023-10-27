//
//  CharacterPresenter.swift
//  KinzooTask
//
//  Created by Victor Sebastian on 2023-10-27.
//

import UIKit

protocol CharacterPresenterDelegate: AnyObject {
    func presentCharacters(with result: Result<[CartoonCharacter], Error>)
}

typealias CharacterDelegate = CharacterPresenterDelegate & UIViewController

final class CharacterPresenter {
    private weak var delegate: CharacterDelegate?
    
    func setViewDelegate(delegate: CharacterDelegate) {
        self.delegate = delegate
    }
    
    func getCharacters() {
        let requestData = APIRequestConfig(endPoint: .getCharacters, method: .get)
        let responseHandler = DefaultAPIResponseHandler<CharacterResponse>()
        
        let networkManager = APIManager()
        networkManager.requestData(request: requestData, responseHandler: responseHandler) { [weak self] result in
            switch result {
            case .success(let response):
                debugPrint("Success: \(response.results.count)")
                self?.delegate?.presentCharacters(with: .success(response.results))
            case .failure(let error):
                debugPrint("Error: \(error)")
                self?.delegate?.presentCharacters(with: .failure(error))
            }
        }
    }
}

