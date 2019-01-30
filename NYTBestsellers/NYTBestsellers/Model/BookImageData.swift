//
//  BookImageData.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct BookImageData {
    let totalItems: Int
    let items: [ItemsData]
}
struct ItemsData {
    let volumeInfo: VolumeInfoData
}

struct VolumeInfoData {
    let description: String
    let imageLinks: ImageLinksData
}

struct ImageLinksData {
    let smallThumbnail: String
    let thumbnail: String
}
