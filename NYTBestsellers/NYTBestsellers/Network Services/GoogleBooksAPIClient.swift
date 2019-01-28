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
    static func getGoogleBookImageUrl(size: String, completionHandler: @escaping ((AppError?, String?) -> Void)) {
        NetworkHelper.shared.performDataTask(endpointURLString: "") { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let bookImageString = try JSONDecoder().decode(GoogleBook.self, from: data)
                    if size == "small" {
                                            completionHandler(nil, bookImageString.items.first?.imageLinks.thumbnail)
                    } else {
                        completionHandler(nil, bookImageString.items.first?.imageLinks.thumbnail)
                    }

                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
