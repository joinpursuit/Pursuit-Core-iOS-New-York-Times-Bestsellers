//
//  NYTBook.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTBook: Codable {
    struct NYTBookData: Codable {
        let status: String          // "OK",
        let copyright: String
        let numResults: Int        // 10,
        let lastModified: String   // "2017-01-07T09:38:02-05:00"
        let results: [NYTBook]
        private enum CodingKeys: String, CodingKey {
            case status
            case copyright
            case numResults = "num_results"
            case lastModified = "last_modified"
            case results
        }
    }
    
    let listName: String                           // "Animals",
    let displayName: String                        // "Animals",
    let bestsellersDate: String                    // "2016-12-31"
    let publishedDate: String                      // "2017-01-15"
    let rank: Int                                   // 1
    let amazonProductUrl: URL
    
    struct BookDetail: Codable {
        let title: String                           // "I COULD PEE ON THIS"
        let description: String                     // "bla bla bla...."
        let author: String                          // "Francesco Marciuliano",
        let publisher: String                       // "Chronicle"
        let primaryIsbn13: String                  // "9781452110585"
        let primaryIsbn10: String                  // "1452110581"
        private enum CodingKeys: String, CodingKey {
            case title
            case description
            case author
            case publisher
            case primaryIsbn13 = "primary_isbn13"
            case primaryIsbn10 = "primary_isbn10"
        }
    }
    let bookDetails: [BookDetail]
    
    struct BookReview: Codable {
        let bookReviewLink: URL
        let firstChapterLink: URL
        let sundayReviewLink: URL
        let articleChapterLink: URL
        private enum CodingKeys: String, CodingKey {
            case bookReviewLink = "book_review_link"
            case firstChapterLink = "first_chapter_link"
            case sundayReviewLink = "sunday_review_link"
            case articleChapterLink = "article_chapter_link"
        }
    }
    let reviews: [BookReview]
    
    private enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case displayName = "display_name"
        case bestsellersDate = "bestsellers_date"
        case publishedDate = "published_date"
        case rank
        case amazonProductUrl = "amazon_product_url"
        case bookDetails = "book_details"
        case reviews
    }
}
