//
//  ImageService.swift
//  technical-test
//
//  Created by mohamed  habib on 27/09/2022.
//  Copyright © 2022 24S. All rights reserved.
//

import Foundation

protocol ImageService {
    
func fetchImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ())
    
}

protocol HasImageService {
    var imageService: ImageService { get }
}
