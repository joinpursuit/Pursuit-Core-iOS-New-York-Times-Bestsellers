//
//  AvailableCategories.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct AvailableCategories: Codable {
    let results: [BookCategories]
}

struct BookCategories: Codable {
    let list_name: String
    let list_name_encoded: String
}

struct SavedBookCategories {
    static var bookCategories: [BookCategories] = []
}
