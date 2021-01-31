//
//  GoogleBookSearchAPIClient.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class GoogleBookSearchAPIClient {
    private init() {}
    public static func getGoogleBooksFromISBN(isbn: String, completionHandler: @escaping (AppError?, GoogleBook?) -> Void) {
        let endpointURLString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)&key=\(SecretKeys.googleBook)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do {
                    let googleBookData = try JSONDecoder().decode(GoogleBook.GoogleBookData.self, from: data)
                    if let googleBooks = googleBookData.items {
                        completionHandler(nil, googleBooks[0])
                    }
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
