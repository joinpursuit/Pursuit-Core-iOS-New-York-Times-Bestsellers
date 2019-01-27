//
//  ImagesForBooks.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ImageForBooks: Codable {
  
  let items: [GoogleImageInfo]
  
}

struct GoogleImageInfo: Codable {
  
  let volumeInfo: [BookDetailInfo]
  
}

struct BookDetailInfo: Codable {
  
  let industryIdentifiers: [ISBN]
  let imageLinks: Images
  
}

struct ISBN: Codable {
  
  let type: String
  let identifier: String
  
}

struct Images: Codable {
  let thumbnail: String //URL
}
