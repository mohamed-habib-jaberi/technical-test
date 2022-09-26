//
//  ListTableViewCell.swift
//  technical-test
//
//  Created by SWOOD on 04/11/2019.
//  Copyright © 2022 SWOOD. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageViewGame: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setup(_ description: String, imageSURL: String) {
        label.text = description
        if let url = URL(string: imageSURL) {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.imageViewGame.image = image
                    }
                }
            }
        }
    }

}
