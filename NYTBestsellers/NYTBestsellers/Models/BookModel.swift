//
//  BookModel.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookModel: Codable {
    let results: [BookResults]
}
struct BookResults: Codable {
    let listName: String
    let displayName: String
    let bestsellersDate: String
    let publishedDate: String
    let rank: Int
    let rankLastWeek: Int
    let weeksOnList: Int
    let asterisk: Int
    let dagger: Int
    let amazonProductUrl: String?
    let isbns: [Isbn]
    let bookDetails: [BookDetails]
    private enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case displayName = "display_name"
        case bestsellersDate = "bestsellers_date"
        case publishedDate = "published_date"
        case rank
        case rankLastWeek = "rank_last_week"
        case weeksOnList = "weeks_on_list"
        case asterisk
        case dagger
        case amazonProductUrl = "amazon_product_url"
        case isbns
        case bookDetails = "book_details"
    }
}
struct Isbn: Codable {
    let isbn10: String
    let isbn13: String
}
struct BookDetails: Codable {
    let title: String
    let bookDescription: String
    let contributor: String
    let author: String
    let ageGroup: String
    let publisher: String
    let primaryIsbn13: String
    let primaryIsbn10: String
    private enum CodingKeys: String, CodingKey {
        case title
        case bookDescription = "description"
        case contributor
        case author
        case ageGroup = "age_group"
        case publisher
        case primaryIsbn13 = "primary_isbn13"
        case primaryIsbn10 = "primary_isbn10"
    }
}
