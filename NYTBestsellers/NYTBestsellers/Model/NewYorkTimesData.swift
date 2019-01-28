//
//  NewYorkTimesData.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct NewYorkTimesData: Codable {
    let numResults: Int
    let results: [BookDataResultsArray]
    enum CodingKeys: String, CodingKey{
        case numResults = "num_results"
        case results
    }
}

struct BookDataResultsArray: Codable {
    let listName: String
    let displayName: String
    let listNameEncoded: String
    let newestPublishedDate: String
    let updated: String
    let rank: Int
    let amazonProductUrl: String
    let bookDetails: [BookDetailDataArray]
    enum CodingKeys: String, CodingKey{
        case listName = "list_name"
        case displayName = "display_name"
        case listNameEncoded = "list_name_encoded"
        case newestPublishedDate = "newest_published_date"
        case updated
        case rank
        case amazonProductUrl = "amazon_product_url"
        case bookDetails = "book_details"
    }
    /*
     enum CodingKeys: String, CodingKey{
     case atomicMass = "atomic_mass"
     case boil
     case melt
     case name
     case namedBy = "named_by"
     case number
     case symbol
     }*/
}

struct BookDetailDataArray: Codable {
    let title: String
    let description: String
    let author: String
    let publisher: String
}
