//
//  NYTModel.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Genres: Codable{
    let results: [Results]
}
struct Results: Codable {
    let listName: String
    let displayName: String
    let listNameEncoded: String
    let oldestPublishedDate: String
    let newestPublishedDate: String
    let updated: String
    
    private enum CodingKeys: String, CodingKey{
        case listName = "list_name"
        case displayName = "display_name"
        case listNameEncoded = "list_name_encoded"
        case oldestPublishedDate = "oldest_published_date"
        case newestPublishedDate = "newest_published_date"
        case updated
    }
}
