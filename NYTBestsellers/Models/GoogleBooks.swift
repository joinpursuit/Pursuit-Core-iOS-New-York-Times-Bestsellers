//
//  GoogleBooks.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct GoogleBooks: Codable {
    let items: [Items]
    
}

struct Items: Codable {
    let volumeInfo: [VolumeInfo]
}

struct VolumeInfo: Codable {
    let industryIdentifiers: [Identifier]
    let imageLinks: [ImageLink]
}

struct Identifier: Codable {
    let identifier: String
}

struct ImageLink: Codable {
    let smallThumbnail: String
    let thumbnail: String
}
