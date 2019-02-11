//
//  BestSellersBook.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 2/11/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BestSellerBook: Codable {
    struct ResultsWrapper: Codable {
        let rank: Int
        let weeksOnList: Int
        let amazonProductUrl: URL
        let bookDetails: [BookDetailsWrapper]
        
        private enum CodingKeys: String, CodingKey{
            case rank
            case weeksOnList = "weeks_on_list"
            case amazonProductUrl = "amazon_product_url"
            case bookDetails = "book_details"
        }
    }
    let results: [ResultsWrapper]
}

struct BookDetailsWrapper: Codable {
    let title: String
    let description: String
    let author: String
    let primaryIsbn10: String
    
    private enum CodingKeys: String, CodingKey{
        case title
        case description
        case author
        case primaryIsbn10 = "primary_isbn10"
    }
}
