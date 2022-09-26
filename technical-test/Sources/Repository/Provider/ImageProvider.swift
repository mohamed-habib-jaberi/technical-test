//
//  ImageProvider.swift
//  technical-test
//
//  Created by mohamed  habib on 27/09/2022.
//  Copyright © 2022 24S. All rights reserved.
//

import Foundation

class ImageProvider: ImageService {
    
    func fetchImage(from urlString: String, completionHandler: @escaping (_ data: Data?) -> ()) {
        let session = URLSession.shared
        let url = URL(string: urlString)
            
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print("Error fetching the image! 😢")
                completionHandler(nil)
            } else {
                completionHandler(data)
            }
        }
            
        dataTask.resume()
    }
}

