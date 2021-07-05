//
//  FavoritedBookModel.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoriteBook: Codable {
    let numberOfWeeksSpent: Int
    let imageUrlStr: String
    let description: String
}

