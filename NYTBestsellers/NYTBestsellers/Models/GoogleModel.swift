//
//  ImageModel.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct GoogleModel: Codable {
    let kind: String
    let totalItems: Int
    let items: [Items]
}
struct Items: Codable {
    let kind: String
    let id: String
    let etag: String
    let selfLink: String
    let volumeInfo:  VolumeInfo
}
struct VolumeInfo: Codable {
    let description: String
    let imageLinks: ImageLinks
}

struct ImageLinks: Codable {
    let smallThumbnail: String
    let thumbnail: String
}
