//
//  BookListResult.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookListResult: Codable {
    let results: [BookList]
}

struct BookList: Codable {
    let weeks_on_list: Int
    let amazon_product_url: String
//    let isbns: [ISBNArray]
    let book_details: [BookDetail]
}

struct BookDetail: Codable {
    let title: String
    let author: String
    let publisher: String
    let bookDescription: String
    let primaryISBN13: String
    let primaryISBN10: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case author
        case publisher
        case bookDescription = "description"
        case primaryISBN13 = "primary_isbn13"
        case primaryISBN10 = "primary_isbn10"
    }
}

//struct ISBNArray: Codable {
//    let isbn10: String
//    let isbn13: String
//}
