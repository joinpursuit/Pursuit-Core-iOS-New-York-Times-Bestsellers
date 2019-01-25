//
//  BestSellerBook.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BestSellerBook: Codable {
    struct ResultsWrapper: Codable {
        let rank: Int
        let weeksOnList: Int
        let isbns: [ISBNWrapper]
        let bookDetails: [BookDetailsWrapper]
        
        private enum CodingKeys: String, CodingKey{
            case rank
            case weeksOnList = "weeks_on_list"
            case isbns
            case bookDetails = "book_details"
        }
    }
    let results: [ResultsWrapper]
}
struct ISBNWrapper: Codable{
    let isbn10: String
}

struct BookDetailsWrapper: Codable {
    let title: String
    let description: String
    let author: String
}
