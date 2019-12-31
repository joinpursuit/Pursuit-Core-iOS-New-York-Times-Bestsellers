//
//  BSModel.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Books: Codable{
    let results: [BookResults]
    let numResults: Int
  private enum CodingKeys: String, CodingKey{
      case numResults = "num_results"
      case results
  }

}
struct BookResults: Codable {
    let weeksOnList: Int
    let amazonProductUrl: String?
    let bookDetails: [BookDetails]
  private enum CodingKeys: String, CodingKey{
       case weeksOnList = "weeks_on_list"
       case amazonProductUrl = "amazon_product_url"
       case bookDetails = "book_details"
   }
}
struct BookDetails: Codable {
    let author: String
    let title: String
    let description: String
    let primaryIsbn13: String
  
  private enum CodingKeys: String, CodingKey{
        case author
        case title
        case description
        case primaryIsbn13 = "primary_isbn13"
    }
}
