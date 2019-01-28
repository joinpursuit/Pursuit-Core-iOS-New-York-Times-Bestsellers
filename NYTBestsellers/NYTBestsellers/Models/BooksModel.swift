//
//  BooksModel.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Books: Codable {
    let results: [Book]
}

struct Book: Codable {
    let weeks_on_list: Int
    let amazon_product_url: URL
    let book_details: [BookDetail]
}

struct BookDetail: Codable {
    let title: String
    let description: String
    let author: String
    let primary_isbn13: String
}
