//
//  HomeInteractor.swift
//  technical-test
//
//  Created by SWOOD on 21/10/2021.
//  Copyright © 2022 SWOOD. All rights reserved.
//

import Foundation

class HomeInteractor {
    
    var presenter: HomePresenter
    
    typealias Dependencies = HasGameService
   
    // MARK: - DI
    struct DI: HomeInteractor.Dependencies {
        var gameService: GameService = GameProvider()
    }

    init(presenter: HomePresenter) {
        self.presenter = presenter
    }
    
    func fetchDatas() {
        
        // Free API : https://rawg.io/apidocs

       let request = NSMutableURLRequest(url: NSURL(string: "https://api.rawg.io/api/games?key=29ca278badb84604a82dcbacf09c0e40")! as URL,
                                               cachePolicy: .useProtocolCachePolicy,
                                           timeoutInterval: 10.0)
    
        DI().gameService.fetchRequest(type: Response.self, url: request as URLRequest) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    print("Fetched new comments")
                   // self.comments = comments
                    self.presenter.controller.datas = response.results
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
