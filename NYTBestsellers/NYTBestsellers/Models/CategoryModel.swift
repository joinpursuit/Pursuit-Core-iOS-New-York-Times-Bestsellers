//
//  BookCoverModel.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
struct Categories:Codable{
  let results:[CategoryInfo]
}
struct CategoryInfo:Codable{
  let list_name:String
}
