//
//  HomePresenter.swift
//  technical-test
//
//  Created by SWOOD on 21/10/2021.
//  Copyright © 2022 SWOOD. All rights reserved.
//

import Foundation

class HomeViewModel {
    var game: Response.Game
    
    init(_ game: Response.Game) {
        self.game = game
    }
}

class HomePresenter {
    
    var controller: ViewController
    
    init(controller: ViewController) {
        self.controller = controller
    }
    
    
}
