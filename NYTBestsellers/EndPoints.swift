//
//  EndPoints.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation



struct EndPoints {
    let endPoint1 = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(APIKey.Key)"
    let endPoint2 = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=(api key here)&list=(category name here)"
    let endPoint3 = "https://www.googleapis.com/books/v1/volumes?q=isbn:(isbn goes here)&key=(api key here)"
}



