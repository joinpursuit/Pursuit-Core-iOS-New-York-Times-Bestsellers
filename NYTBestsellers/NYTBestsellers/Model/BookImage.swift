//
//  BookImage.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookInfo: Codable {
    let items: [ItemDetails]
}
struct ItemDetails: Codable {
    let volumeInfo: VolumeInformations
}
struct VolumeInformations: Codable {
    let imageLinks: ImageLink
    let description: String
    

}
struct ImageLink:Codable {
    let smallThumbnail: String
    let thumbnail: String
}
