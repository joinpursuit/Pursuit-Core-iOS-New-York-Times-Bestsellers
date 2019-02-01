//
//  BookImageData.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct GoogleBookImageInfo: Codable {
    let totalItems: Int
    let items: [ItemsContainer]?
}
struct ItemsContainer: Codable {
    let volumeInfo: VolumeInfoData
}

struct VolumeInfoData: Codable {
    let description: String
    let imageLinks: ImageLinksData
}

struct ImageLinksData: Codable {
    let smallThumbnail: String
}
