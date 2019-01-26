//
//  BookListName.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct BookListName: Codable {
    let numResults: Int
    struct resultsWrapper: Codable{
        let listName: String
        
        private enum CodingKeys: String, CodingKey{
            case listName = "list_name"
        }
    }
    let results: [resultsWrapper]
    
    private enum CodingKeys: String, CodingKey{
        case numResults = "num_results"//REMOVE _ //ALSO USE NSCAChE (LOOK EVENT PROJECT)
        case results
    }
}

