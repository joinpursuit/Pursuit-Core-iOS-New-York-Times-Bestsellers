//
//  Favorites.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoriteBook: Codable {
    let imageData: Data
    let author: String
    let description: String
    let createdAt: String
    let amazonLink: String
    let title: String
}
