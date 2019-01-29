//
//  BookImage.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct GoogleBook: Codable {
    let items: [GoogleBookDetails]?
}

struct GoogleBookDetails: Codable {
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Codable {
    let bookLongDescription: String
    let imageLinks: ImageLinks
    
    enum CodingKeys: String, CodingKey {
        case bookLongDescription = "description"
        case imageLinks
    }
}

struct ImageLinks: Codable {
    let smallThumbnail: String
    let thumbnail: String
}
