//
//  NewBookDirectoryModel.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct NewBookCodable:Codable{
  let authorName: String
  let description:String
  let bookName:String
  let imageData: Data?
}
