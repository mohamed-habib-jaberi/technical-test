//
//  DetailsInteractor.swift
//  technical-test
//
//  Created by SWOOD on 21/10/2021.
//  Copyright © 2022 SWOOD. All rights reserved.
//

import Foundation

class DetailsInteractor {
    
    let presenter: DetailsPresenter
    
    var game: Response.Game?
    
    init(presenter: DetailsPresenter) {
        self.presenter = presenter
    }
    
    func loadDatas() {
        presenter.present(game!)
    }
}
