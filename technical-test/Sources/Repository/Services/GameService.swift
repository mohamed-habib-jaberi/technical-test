//
//  GameService.swift
//  technical-test
//
//  Created by mohamed  habib on 26/09/2022.
//  Copyright © 2022 24S. All rights reserved.
//

import Foundation


/// A protocol abstracting the call
/// to the API to fetch the result Game list
protocol GameService {
    /// Retrieve theList of Game
    func fetchRequest<T: Codable>(type: T.Type, url: URLRequest, completion: @escaping(Result<T, GameError>) -> Void)
}

protocol HasGameService {
    var gameService: GameService { get }
}
