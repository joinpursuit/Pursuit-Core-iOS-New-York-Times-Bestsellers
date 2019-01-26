//
//  BestsellerModel.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBestseller: Codable {
    let results: [Books]
}

struct Books: Codable {
    let displayName: String
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        
    }
}
