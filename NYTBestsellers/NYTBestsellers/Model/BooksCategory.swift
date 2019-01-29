//
//  BooksCategory.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Category: Codable {
     let results: [BookCategories]
}
struct BookCategories: Codable {
    let list_name: String
}
