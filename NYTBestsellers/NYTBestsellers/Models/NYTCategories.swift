//
//  NYTCategories.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTCategories: Codable {

  let results: [BookCategories]
  
}

struct BookCategories: Codable {

  let listName: String
  
  private enum CodingKeys: String, CodingKey {
    case listName = "list_name"
  }
  
}
