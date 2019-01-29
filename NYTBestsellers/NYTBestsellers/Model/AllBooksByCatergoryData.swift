//
//  AllBooksByCatergoryData.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct AllBooksByCatergoryData: Codable {
    let numberOfBookResults: Int
    let resultsForCategory: [ResultsOfBestSellerBooks]
    enum CodingKeys: String, CodingKey{
        case numberOfBookResults = "num_results"
        case resultsForCategory = "results"
    }
}
struct ResultsOfBestSellerBooks: Codable {
    let categoryName: String
    let amazonLink: String
    let moreBookInformation: [AllBookDetailInfo]
    enum CodingKeys: String, CodingKey{
        case categoryName = "list_name"
        case amazonLink = "amazon_product_url"
        case moreBookInformation = "book_details"
    }
}

struct AllBookDetailInfo: Codable {
    let titleOfBestSeller: String
    let authorOfBestSeller: String
    let booksDescription: String
    enum CodingKeys: String, CodingKey{
        case titleOfBestSeller = "title"
        case authorOfBestSeller = "author"
        case booksDescription = "description"
    }
}


