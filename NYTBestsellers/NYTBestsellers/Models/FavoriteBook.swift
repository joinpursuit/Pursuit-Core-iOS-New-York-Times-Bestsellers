//
//  FavoritesModel.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoriteBook: Codable {
  
  let imageData: Data?
  let weeksOnBestSellerList: String
  let bookDescription: String
  let createdAt: String
  
}
