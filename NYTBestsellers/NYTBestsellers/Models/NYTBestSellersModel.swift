//
//  NYTBestSellersModel.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBestSellersModel: Codable {
  
  let results: [BookGeneralInfo]
  
}

struct BookGeneralInfo: Codable {
  
  let weeksOnList: Int
  let amazonProductURL: String
  let bookDetails: [DetailedBookInfo]
  
  private enum CodingKeysForBestSellerModel: String, CodingKey {
    case weeksOnList = "weeks_on_list"
    case amazonProductURL = "amazon_product_url"
    case bookDetails = "book_details"
  }
  
}

struct DetailedBookInfo: Codable {
  let title: String
  let description: String
  let author: String
  let primaryISBN13: String
  
  private enum CodingKeysForBestSellerModel: String, CodingKey {
    case primaryISBN13 = "primary_isbn13"
    
  }
}




