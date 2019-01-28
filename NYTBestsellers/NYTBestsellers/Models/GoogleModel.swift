//
//  GoogleModel.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Google: Codable {
    let items: [Item]?
}
struct Item: Codable {
    let volumeInfo: VolumeInfo
}
struct VolumeInfo: Codable {
    let imageLinks: ImageLinks
}
struct ImageLinks: Codable {
    let smallThumbnail: String
    let thumbnail: String
}
