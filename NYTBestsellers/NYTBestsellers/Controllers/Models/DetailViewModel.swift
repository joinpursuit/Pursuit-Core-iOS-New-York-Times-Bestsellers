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
    let title: String
    let description: String
}
