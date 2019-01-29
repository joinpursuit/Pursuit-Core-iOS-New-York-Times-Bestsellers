//
//  NYTModel.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation



struct NYTModel: Codable {
    let results: [Results]
}

struct Results: Codable {
    let list_name: String
    let display_name: String
//    let bestsellers_date: String
//    let published_date: String
//    let rank: Int
//    let amazon_product_url: URL
//    let isbns: [Isbns]
//    let book_details: [BookDetails]
}

//struct Isbns: Codable {
//
//}
//
//struct BookDetails: Codable {
//    let title: String
//    let description: String
//    let contributor: String
//    let author: String
//    let publisher: String
//    let primary_isbn13: String
//    let primary_isbn10: String
//}
