//
//  NewYorkTimesData.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct NewYorkTimesData: Codable {
    let num_results: Int
    let results: [BookDataResultsArray]
}

struct BookDataResultsArray: Codable {
    let list_name: String
    let display_name: String
    let list_name_encoded: String
    let newest_published_date: String
    let updated: String
    let rank: Int
    let amazon_product_url: String
    let book_details: [BookDetailDataArray]
}

struct BookDetailDataArray: Codable {
    let title: String
    let description: String
    let author: String
    let publisher: String
}
