//
//  NYTBestsellingBooksAPIClient.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTBestsellingBooksAPIClient {
    private init() {}
    public static func getAllBooks(category: String, completionHandler: @escaping (AppError?, [NYTBook]?) -> Void) {
        let endpointURLString = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.newYorkTimes)&list=\(category)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do {
                    let bookData = try JSONDecoder().decode(NYTBook.NYTBookData.self, from: data)
                    completionHandler(nil, bookData.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
