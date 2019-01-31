//
//  BooksModel.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct Books:Codable{
  let results:[Results]
}
struct Results:Codable {
  let amazon_product_url:URL
  let weeks_on_list:Int
  let rank:Int
  let book_details:[BookDetails]
}

struct BookDetails:Codable{
  let title:String
  let description:String
  let author:String
  let primary_isbn13: String
}
