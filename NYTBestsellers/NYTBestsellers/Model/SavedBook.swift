//
//  savedBookInfo.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct SavedBook: Codable {
    let title: String
    let author: String
    let shortDescription: String
    let longDescription: String
    let bookImage: Data?
    let amazonLink: String
    let isbn13: String
    var addedDate: String?
    public var date: Date {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let dateExists = addedDate {
            if let date = isoDateFormatter.date(from: dateExists) {
                formattedDate = date
            }
        }
        return formattedDate
    }
}
