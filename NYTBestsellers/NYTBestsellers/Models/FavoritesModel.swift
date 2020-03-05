//
//  FavoritesModel.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct FavoritesBook: Codable {
    let imageData: Data?
    let weeksOnBestSellerList: String
    let bookDescription: String
    let createdAt: String
}
