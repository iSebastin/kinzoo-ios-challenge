//
//  APIManager.swift
//  KinzooTask
//
//  Created by Victor Sebastian on 2023-10-27.
//

import Foundation

class APIManager {
    private let urlSession: URLSession
    
    init() {
        urlSession = URLSession.shared
    }
    
    func requestData<Request: APIRequest, ResponseHandler: APIResponseHandler>(
        request: Request,
        responseHandler: ResponseHandler,
        completion: @escaping (Result<ResponseHandler.ResponseType, Error>) -> Void) {
            
            guard let url = URL(string: request.endPoint.path) else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = request.method.rawValue
            urlRequest.allHTTPHeaderFields = request.headers
            urlRequest.httpBody = request.body
            
            urlSession.dataTask(with: urlRequest) { (data, response, error) in
                let result = responseHandler.handleResponse(data: data, response: response as? HTTPURLResponse, error: error)
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            .resume()
        }
}
