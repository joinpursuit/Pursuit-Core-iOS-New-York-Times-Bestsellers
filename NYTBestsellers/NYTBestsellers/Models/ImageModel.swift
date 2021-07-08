//
//  ImageModel.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Items: Codable {
    let items: [Info]
}

struct Info: Codable {
    let volumeInfo: ImageLink
}

struct ImageLink: Codable {
    let description: String
    let imageLinks: Links
}

struct Links: Codable {
    let smallThumbnail: URL
    let thumbnail: URL
}
