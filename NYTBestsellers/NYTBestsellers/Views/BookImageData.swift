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
    let items: [ItemsDataArray]
}
struct ItemsDataArray {
    let volumeInfo: VolumeInfoDictionaryData
}

struct VolumeInfoDictionaryData {
    let description: String
    let imageLinks: ImageLinksDictionaryData
}

struct ImageLinksDictionaryData {
    let smallThumbnail: String
    let thumbnail: String
}
