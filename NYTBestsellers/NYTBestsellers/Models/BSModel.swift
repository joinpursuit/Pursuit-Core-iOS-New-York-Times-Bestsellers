//
//  BSModel.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Books: Codable{
    let results: [BookResults]
    let num_results: Int
}
struct BookResults: Codable {
    let weeks_on_list: Int
    let book_details: [BookDetails]
}
struct BookDetails: Codable {
    let title: String
    let description: String
    let primary_isbn13: String
}
