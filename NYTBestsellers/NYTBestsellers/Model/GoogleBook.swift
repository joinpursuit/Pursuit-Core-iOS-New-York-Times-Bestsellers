//
//  GoogleBook.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct GoogleBook: Codable {
    struct GoogleBookData: Codable {
        let items: [GoogleBook]?
    }
    
    struct VolumeInfo: Codable {
        let title: String
        let subtitle: String?
        let authors: [String]?
        let publisher: String?
        let publishedDate: String
        let description: String
        
        struct IndustryIdentifier: Codable {
            let type: String
            let identifier: String
        }
        let industryIdentifiers: [IndustryIdentifier]
        let pageCount: Int
        let printType: String
        let categories: [String]
        let maturityRating: String
        struct ImageLinks: Codable {
            let smallThumbnail: URL
            let thumbnail: URL
        }
        let imageLinks: ImageLinks
    }
    let volumeInfo: VolumeInfo
}
