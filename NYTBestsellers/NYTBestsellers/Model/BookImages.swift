//
//  BookImages.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 2/11/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookImages: Codable {
    struct ItemsWrapper: Codable {
        let volumeInfo: VolumeInfoWrapper
    }
    let items: [ItemsWrapper]
}
struct VolumeInfoWrapper: Codable {
    let imageLinks: ImageWrapper
    let description: String
}
struct ImageWrapper: Codable {
    let smallThumbnail: String
    let thumbnail: String
    
}
