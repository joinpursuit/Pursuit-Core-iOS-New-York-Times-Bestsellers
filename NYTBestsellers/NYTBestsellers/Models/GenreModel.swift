//
//  GenreModel.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Genre: Codable {
    let results: [ListNames]
}

struct ListNames: Codable {
    let list_name: String
}
