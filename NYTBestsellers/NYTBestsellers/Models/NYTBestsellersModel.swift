//
//  NYTBestsellersModel.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBestseller: Codable {
    let results: [BookCategories]
}

struct BookCategories: Codable {
    let categoryName: String
    enum CodingKeys: String, CodingKey {
        case categoryName = "list_name"
    
    }
}
