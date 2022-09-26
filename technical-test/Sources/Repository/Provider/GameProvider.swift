//
//  GameProvider.swift
//  technical-test
//
//  Created by mohamed  habib on 26/09/2022.
//  Copyright © 2022 24S. All rights reserved.
//

import Foundation

// MARK: Enums
enum GameError: Error {
    case BadURL
    case NoData
    case DecodingError
}

class GameProvider: GameService {
    let aPIHandler: APIHandlerDelegate
    let responseHandler: ResponseHandlerDelegate
    
    init(aPIHandler: APIHandlerDelegate = APIHandler(),
         responseHandler: ResponseHandlerDelegate = ResponseHandler()) {
        self.aPIHandler = aPIHandler
        self.responseHandler = responseHandler
    }
    
    func fetchRequest<T: Codable>(type: T.Type, url: URLRequest?, completion: @escaping(Result<T, GameError>) -> Void) {
        
        guard let url = url else {
            return completion(.failure(.BadURL))
        }
       
        aPIHandler.fetchData(url: url) { result in
            switch result {
            case .success(let data):
                self.responseHandler.fetchModel(type: type, data: data) { decodedResult in
                    switch decodedResult {
                    case .success(let model):
                        completion(.success(model))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

protocol APIHandlerDelegate {
    func fetchData(url: URLRequest, completion: @escaping(Result<Data, GameError>) -> Void)
}

class APIHandler: APIHandlerDelegate {
    func fetchData(url: URLRequest, completion: @escaping(Result<Data, GameError>) -> Void) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.NoData))
            }
            completion(.success(data))
           
        }.resume()
    }
    
}


protocol ResponseHandlerDelegate {
    func fetchModel<T: Codable>(type: T.Type, data: Data, completion: (Result<T, GameError>) -> Void)
}

class ResponseHandler: ResponseHandlerDelegate {
    func fetchModel<T: Codable>(type: T.Type, data: Data, completion: (Result<T, GameError>) -> Void) {
        let commentResponse = try? JSONDecoder().decode(type.self, from: data)
        if let commentResponse = commentResponse {
            return completion(.success(commentResponse))
        } else {
            completion(.failure(.DecodingError))
        }
    }
    
}

