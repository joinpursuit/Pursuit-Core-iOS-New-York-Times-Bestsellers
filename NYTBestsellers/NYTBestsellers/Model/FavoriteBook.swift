//
//  FavoriteBook.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct FavoriteBook: Codable {
    let bookName: String
    let favoritedAt: String
    let imageData: Data
    let description: String
    let amazonURL: URL
    
    public var date: Date {
        let date = favoritedAt.date()
        return date
    }
}
