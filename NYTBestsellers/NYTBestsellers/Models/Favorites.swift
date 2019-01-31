//
//  Favorites.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoritedBook : Codable {
    let bookName: String
    let favoritedAt: String
    let imageData: Data
    let description: String
    

public var date: Date {
    let date = favoritedAt.date()
    return date
}
}
