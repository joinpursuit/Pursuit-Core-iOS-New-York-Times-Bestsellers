//
//  GoogleModel.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookInfo: Codable {
    let items:[ItemDetails]?
}
struct ItemDetails: Codable {
    let volumeInfo: VolumeInformations
}
struct VolumeInformations: Codable {
    let imageLinks: ImageLink
    
    
}
struct ImageLink:Codable {
    let smallThumbnail: String
    let thumbnail: String
}
