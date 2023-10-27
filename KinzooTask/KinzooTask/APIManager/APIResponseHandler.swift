//
//  APIResponseHandler.swift
//  KinzooTask
//
//  Created by Victor Sebastian on 2023-10-27.
//

import Foundation

protocol APIResponseHandler {
    associatedtype ResponseType: Decodable
    
    func handleResponse(data: Data?, response: HTTPURLResponse?, error: Error?) -> Result<ResponseType, Error>
}

struct DefaultAPIResponseHandler<T: Decodable>: APIResponseHandler {
    
    func handleResponse(data: Data?, response: HTTPURLResponse?, error: Error?) -> Result<T, Error> {
        if let error = error {
            return .failure(error)
        }
        
        guard let httpResponse = response, (200...299).contains(httpResponse.statusCode) else {
            return .failure(NSError(domain: "HTTP Error", code: 0, userInfo: nil))
        }
        
        do {
            if let responseData = data {
                let decodedData = try JSONDecoder().decode(T.self, from: responseData)
                return .success(decodedData)
            } else {
                return .failure(NSError(domain: "No data received", code: 0, userInfo: nil))
            }
        } catch {
            return .failure(error)
        }
    }
}
