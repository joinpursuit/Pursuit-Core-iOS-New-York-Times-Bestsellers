//
//  FavoriteBook.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

struct FavoriteBook: Codable {
    let bookDetails: NYTBook
    let imageData: Data?
    let timeStamp: String
}
