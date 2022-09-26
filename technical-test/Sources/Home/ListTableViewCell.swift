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
    
    typealias Dependencies = HasImageService
   
    // MARK: - DI
    struct DI: ListTableViewCell.Dependencies {
        var imageService: ImageService = ImageProvider()
    }

    
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
        self.setImageToImageView(imageSURL: imageSURL)
    }
    
    func setImageToImageView(imageSURL: String) {
        DI().imageService.fetchImage(from: imageSURL) { imageData in
            if let data = imageData {
                
                DispatchQueue.main.async {
                    self.imageViewGame.image = UIImage(data: data)
                }
            } else {
                print("Error loading image");
            }
        }
    }
    
}
