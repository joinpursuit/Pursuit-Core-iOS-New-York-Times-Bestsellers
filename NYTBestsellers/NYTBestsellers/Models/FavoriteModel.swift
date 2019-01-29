//
//  FavoriteModel.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoriteBook: Codable {
    let createdAt: String
    let description: String
    let weeks_on_list: Int
    let image: URL
    let link: URL
    let primary_isbn13: String
}
