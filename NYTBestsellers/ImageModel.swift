//
//  ImageModel.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct items: Codable {
    let items: [Info]
}

struct Info: Codable{
    let volumeInfo: ImageLink
}
struct ImageLink: Codable {
    let imageLinks: Links
}
struct Links: Codable {
    let thumbnail: URL
    let smallthumbnail: URL
}
