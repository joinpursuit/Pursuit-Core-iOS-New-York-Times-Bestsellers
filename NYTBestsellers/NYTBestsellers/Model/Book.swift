//
//  Book.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Book: Codable {
    let name: String
    let description: String
    let imageData: Data?
}
