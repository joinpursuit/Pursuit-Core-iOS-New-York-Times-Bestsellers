//
//  GenreModel.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct Results: Codable {
    let results: [Genre]
}

struct Genre: Codable {
    let list_name: String
}
