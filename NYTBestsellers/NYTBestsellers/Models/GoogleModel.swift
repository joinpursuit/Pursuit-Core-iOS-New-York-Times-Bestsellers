//
//  GoogleModel.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct GoogleBooks: Codable {
    let items: [BookVolume]
}

struct BookVolume: Codable {
    let volumeInfo: BookInfo
}

struct BookInfo: Codable {
    let description: String
    let imageLinks: BookImages
}

struct BookImages: Codable {
    let smallThumbnail: URL
    let thumbnail: URL
}
