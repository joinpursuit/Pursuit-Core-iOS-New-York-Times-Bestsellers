//
//  FavoriteBook.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoriteBooks: Codable {
    let author: String
    let imageData: Data?
    let description: String
    
}
