//
//  DetailsPresenter.swift
//  technical-test
//
//  Created by SWOOD on 21/10/2021.
//  Copyright © 2022 SWOOD. All rights reserved.
//

import Foundation
import UIKit

class DetailsViewModel {
    let gameName: String
    let gameRating: String
    var gameImage: UIImage?
    
    init(_ game: Response.Game) {
        self.gameName = game.name
        self.gameRating = "Rating: \(game.rating)"
        if let url = URL(string: game.background_image) {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.gameImage = image
                    }
                }
            }
        }
    }
}

class DetailsPresenter {
    
    let viewController: UIViewController
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func present(_ game: Response.Game) {
        let VM = DetailsViewModel(game)
        (self.viewController as? DetailsViewController)?.layout(VM)
    }
}
