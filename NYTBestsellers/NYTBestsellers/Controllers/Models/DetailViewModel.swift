//
//  DetailViewModel.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBestSellersDetail: Codable {
    let items: [BookInfo]
}
struct BookInfo: Codable {
    let selfLink: String
    let volumeInfo: volumeDetailInfo
}

struct volumeDetailInfo: Codable {
    let title: String
    let authors: [String]
    let description: String
    let imageLinks: BookImage
}

struct BookImage: Codable {
    let smallThumbnail: String
    let thumbnail: String 
}
