//
//  BooksModel.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookInfo :Codable {
 // let kind: String
  let totalItems: Int
  let items: [Book]
}
struct Book:Codable {
 // let kind: String
  let volumeInfo: VolumeInfo?
}
struct VolumeInfo:Codable {
  let description:String
  let imageLinks: ImageLinks
}
struct ImageLinks:Codable {
  let smallThumbnail:URL
}
