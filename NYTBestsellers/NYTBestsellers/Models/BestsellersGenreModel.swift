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
    
    let listName: String
   private enum CodingKeys: String, CodingKey {
        case listName = "list_name"
    }
    
}
