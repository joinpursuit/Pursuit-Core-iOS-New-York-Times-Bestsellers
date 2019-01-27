//
//  SavedModel.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct SavedModel: Codable {
    let imageData: Data
    let title: String
    let description: String
    let createdAt: String
}
