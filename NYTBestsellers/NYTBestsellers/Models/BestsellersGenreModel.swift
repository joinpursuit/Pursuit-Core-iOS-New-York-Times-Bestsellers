//
//  BestsellersGenreModel.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct Genre: Codable {
    let results: [BestsellerGenre]
}
struct BestsellerGenre: Codable {
    let displayName: String
    let listName: String
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case listName = "list_name"
    }
    
}
