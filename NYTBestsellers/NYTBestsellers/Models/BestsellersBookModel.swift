//
//  BestsellersBookModel.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BestsellersBookModel: Codable {
    let results: [Books]
}

struct Books: Codable {
    let listName: String
    let displayName: String
    let rank: Int
    let rankLastWeek: Int
    let weeksOnList: Int
    let amazonProductUrl: String
    let bookDetails: [BookDetail]
enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case listName = "list_name"
        case rank
        case rankLastWeek = "rank_last_week"
        case weeksOnList = "weeks_on_list"
        case amazonProductUrl = "amazon_product_url"
        case bookDetails = "book_details"
        
    }
}

struct BookDetail: Codable {
    let title: String
    let description: String
    let author: String
    let primaryIsbn13: String
    let googleDescription: String?
    enum CodingKeys: String, CodingKey {
        case title
        case googleDescription
        case description
        case author
        case primaryIsbn13 = "primary_isbn13"
        
    }
    
}
