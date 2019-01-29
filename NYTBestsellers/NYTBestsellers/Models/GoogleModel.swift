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
    //Items might need to be optional if the isbn number doesn't return any results
}
struct Items: Codable {
    let kind: String
    let id: String
    let etag: String
    let selfLink: String
    let volumeInfo:  VolumeInfo
//    let saleInfo: [SaleInfo]
}
struct VolumeInfo: Codable {
//    let title: String
//    let authors: [String]
//    let publisher: String
//    let publishedDate: String
    let description: String
//    let pageCount: Int
//    let printType: String
//    let maturityRating: String
//    let contentVersion: String
    let imageLinks: ImageLinks
//    let language: String
//    let previewLink: String
//    let infoLink: String
//    let canonicalVolumeLink: String
}
//struct SaleInfo: Codable {
//    let country: String
//    let saleability: String
//    let isEbook: Bool
//}

struct ImageLinks: Codable {
    let smallThumbnail: String
    let thumbnail: String
    
}
