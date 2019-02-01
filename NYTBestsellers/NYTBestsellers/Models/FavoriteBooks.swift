//
//  FavoriteBooks.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoriteBooks: Codable {
    let bookName: String
    let favoritedAt: String
    let imageData: Data
    let description: String


    public var date: Date {
        let date = favoritedAt.date()
        return date
    }

}
