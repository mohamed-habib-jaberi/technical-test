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

    init(presenter: HomePresenter) {
        self.presenter = presenter
    }
    
    
    func fetchDatas() {
        
        // Free API : https://rawg.io/apidocs


       let request = NSMutableURLRequest(url: NSURL(string: "https://api.rawg.io/api/games?key=29ca278badb84604a82dcbacf09c0e40")! as URL,
                                               cachePolicy: .useProtocolCachePolicy,
                                           timeoutInterval: 10.0)
       request.httpMethod = "GET"

       let session = URLSession.shared
       let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
           if (error != nil) {
               print(error!)
           } else {
               let response = try! JSONDecoder().decode(Response.self, from: data!)
               DispatchQueue.main.async {
                   self.presenter.controller.datas = response.results
               }
           }
       })

       dataTask.resume()
    }
    
}
