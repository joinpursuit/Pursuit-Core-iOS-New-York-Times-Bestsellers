//
//  Book.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookDetails: Codable{
    let num_results: Int
    let last_modified: String?
    let results: [BookDetailsAndCredentials]
}
struct BookDetailsAndCredentials: Codable {
    let list_name: String
    let display_name: String
    let bestsellers_date: String
    let published_date: String
    let rank: Int
    let rank_last_week: Int
    let weeks_on_list: Int
    let isbns: [IsbnsDetails]
    let book_details: [DetailsOfBook]
    let reviews: [reviewsInfo]
}
struct IsbnsDetails: Codable {
    let isbn13: String
}

struct DetailsOfBook: Codable {
    let title: String
    let description: String?
    let contributor: String?
    let author: String
    let contributor_note:String?
    let publisher: String
    
}

struct reviewsInfo: Codable {
    let book_review_link: String?
}
