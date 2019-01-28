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
    let imageLinks: ImageLinks
}

struct ImageLinks: Codable {
    let smallThumbnail: String
    let thumbnail: String
}
