//
//  NYTModel.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation



struct NYTModel: Codable {
    let results: [Results]
}

struct Results: Codable {
    let list_name: String
    let display_name: String
//    let bestsellers_date: String
//    let published_date: String
//    let rank: Int
//    let amazon_product_url: URL
// let isbns: [Isbns]
   
}

//struct Isbns: Codable {
//    let isbn10: String
//}
//

