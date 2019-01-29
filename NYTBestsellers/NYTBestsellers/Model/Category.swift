//
//  NewYorkTimesData.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct NewYorkTimesData: Codable {
    let numResults: Int
    let results: [Category]
    enum CodingKeys: String, CodingKey{
        case numResults = "num_results"
        case results
    }
}

struct Category: Codable {
    let listName: String
    enum CodingKeys: String, CodingKey{
        case listName = "list_name"
    }
}

