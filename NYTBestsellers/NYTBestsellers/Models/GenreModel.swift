//
//  GenreModel.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Genre: Codable {
    let results: [GenreType]
}

struct GenreType: Codable {
    let list_name: String
}
