//
//  GoogleBookModel.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Google: Codable {
    let items: [GoogleAPIInfo]?
    
}

struct GoogleAPIInfo: Codable {
    let volumeInfo: BookDetailInfo
    
}

struct BookDetailInfo: Codable {
    let imageLinks: Image
    let description: String?
    
}


struct Image: Codable {
    let thumbnail: String //URL
}
