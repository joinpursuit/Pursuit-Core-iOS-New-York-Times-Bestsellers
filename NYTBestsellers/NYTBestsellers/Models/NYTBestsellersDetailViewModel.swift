//
//  NYTBestsellersDetailViewModel.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBestsellersDetail: Codable {
    let items: [BookInfo]
}

struct  BookInfo: Codable {
    let title: String
    let description: String
}
