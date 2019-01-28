//
//  GoogleBooksAPIClient.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct GoogleBooksAPIClient {
    private init() { }
    static func getGoogleBookImageUrl(bookISBN: String, completionHandler: @escaping ((AppError?, String?) -> Void)) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(bookISBN)&key=\(SecretKeys.googleAPIKeys[0])") { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let bookExists = try JSONDecoder().decode(GoogleBook.self, from: data)
                        completionHandler(nil, bookExists.items?.first?.volumeInfo.imageLinks.thumbnail)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
