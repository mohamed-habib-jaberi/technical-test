//
//  DetailsViewController.swift
//  technical-test
//
//  Created by SWOOD on 04/11/2019.
//  Copyright © 2022 SWOOD. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var interactor: DetailsInteractor!
    var game: Response.Game!

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var imageViewGame: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.interactor = DetailsInteractor(presenter: DetailsPresenter(viewController: self))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactor.game = game
        self.interactor.loadDatas()
    }
    
    func layout(_ game: DetailsViewModel) {
        label.text = game.gameName
        labelRating.text = game.gameRating
        self.imageViewGame.image = game.gameImage
    }
    

}
