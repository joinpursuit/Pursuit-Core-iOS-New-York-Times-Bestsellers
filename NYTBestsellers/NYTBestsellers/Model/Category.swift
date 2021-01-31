//
//  Category.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Category: Codable {
    struct CategoryData: Codable {
        let status: String          // "OK"
        let copyright: String       // "Copyright (c) 2019 The New York Times Company.  All Rights Reserved.",
        let numResults: Int        // 55
        let results: [Category]
        private enum CodingKeys: String, CodingKey {
            case status
            case copyright
            case numResults = "num_results"
            case results
        }
    }
    
    let displayName: String               // "Combined Print & E-Book Fiction",
    let listNameEncoded: String           // "combined-print-and-e-book-fiction"
    let oldestPublishedDate: String       //"2011-02-13"
    let newestPublishedDate: String       // "2019-02-03"
    let updated: String                   //"WEEKLY"
    private enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case listNameEncoded = "list_name_encoded"
        case oldestPublishedDate = "oldest_published_date"
        case newestPublishedDate = "newest_published_date"
        case updated
    }
}
