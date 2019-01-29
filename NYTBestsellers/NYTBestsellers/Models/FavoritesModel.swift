//
//  FavoritesModel.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoriteBooks: Codable {
  let imageData: Data
  let weeksOnBestSellerList: String
  let bookDescription: String
  let createdAt: String
  
  public var dateFormattedString: String {
    let isoDateFormatter = ISO8601DateFormatter()
    var formattedDate = createdAt
    if let date = isoDateFormatter.date(from: createdAt) {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "MMMM d, yyyy hh:mm a"
      formattedDate = dateFormatter.string(from: date)
    }
    return formattedDate
  }
  
  public var date: Date {
    let isoDateFormatter = ISO8601DateFormatter()
    var formattedDateFromDate = Date()
    if let date = isoDateFormatter.date(from: createdAt){
      formattedDateFromDate = date
    }
    return formattedDateFromDate
  }
}
