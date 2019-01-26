//
//  BookImage.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookImage: Codable {
    struct ItemsWrapper: Codable {
        let volumeInfo: VolumeInfoWrapper
    }
    let items: [ItemsWrapper]
}
struct VolumeInfoWrapper: Codable {
    let imageLinks: ImageWrapper
}
struct ImageWrapper: Codable {
    let smallThumbnail: String
    let thumbnail: String
    
}
