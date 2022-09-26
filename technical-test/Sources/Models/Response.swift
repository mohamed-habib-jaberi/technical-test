//
//  Response.swift
//  technical-test
//
//  Created by SWOOD on 04/11/2019.
//  Copyright © 2022 SWOOD. All rights reserved.
//

import Foundation

struct Response: Codable {
    
    struct Game: Codable {
        let name: String
        let background_image: String
        let rating: Double
    }
    
    let results: [Game]
}
