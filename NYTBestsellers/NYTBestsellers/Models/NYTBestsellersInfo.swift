//
//  NYTBestsellersCollectionViewModel.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct  NYTBestsellersInfo: Codable {
    let results: [BookData]
}

struct BookData: Codable {
    let list_name: String
    let display_name: String
    let weeks_on_list: Int
    let amazon_product_url: String
    let isbns: [ISBNS]
    let book_details: [Details]
}
struct ISBNS: Codable {
        let isbn13: String
}
struct Details: Codable {
        let title: String
        let description: String
        let author: String
        let contributor: String
    }





