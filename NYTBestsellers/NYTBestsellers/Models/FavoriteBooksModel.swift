//
//  FavoriteBooksModel.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoriteBooks: Codable {
    let bookImage: Data
    let weeksOnBS: Int
    let desciption: String
    let createdAt: String
    let amazonLink: URL
    
}
