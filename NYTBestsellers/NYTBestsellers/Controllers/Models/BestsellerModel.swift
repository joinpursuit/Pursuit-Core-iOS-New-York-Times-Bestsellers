//
//  BestsellerModel.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBestseller: Codable {
    let results: [Books]
}

struct Books: Codable {
    let listName: String
    let displayName: String?
    let weeksOnList: Int?
    let amazonProductUrl: String?
    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case displayName = "display_name"
        case weeksOnList = "weeks_on_list"
        case amazonProductUrl = "amazon_product_url"
        case bookDetails = "book_details"
        
    }
    let bookDetails: [BookDetail]?
}

struct BookDetail: Codable {
    let title: String
    let description: String
    let contributor: String
    let author: String
    let price: Double
    let publisher: String
    let primary_isbn10: String
    let primary_isbn13: String
}
