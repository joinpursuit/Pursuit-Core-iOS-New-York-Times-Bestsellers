//
//  BestsellersGenreModel.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct NYTBestseller: Codable {
    let results: [Books]
}

struct Books: Codable {
    let displayName: String
    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        
    }
}


struct NYTBestSellersDetail: Codable {
    let items: [BookInfo]
}

struct BookInfo: Codable {
    let title: String
    let description: String
}

struct NYTBestsellerCollection: Codable {
    let results: [BookData]
}

struct BookData: Codable {
    let isbns: [ISBNS]
    let bookDetails: [Collection]
    let weeksOnList: Int
    let amazonProductUrl: String
    enum CodingKeys: String, CodingKey {
        case isbns
        case bookDetails = "book_details"
        case weeksOnList = "weeks_on_list"
        case amazonProductUrl = "amazon_product_url"
    }
}

struct ISBNS: Codable {
    let isbn13: String
}

struct Collection: Codable {
    let title: String
    let description: String
}


