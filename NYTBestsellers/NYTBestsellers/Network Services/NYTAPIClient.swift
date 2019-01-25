//
//  NYTAPIClient.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct NYTAPIClient {
    private init() { }
    static func getBookList(completionHandler: @escaping ((AppError?, [BookList]?) -> Void)) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.nytAPIKey)") { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let bookData = try JSONDecoder().decode(BookListData.self, from: data)
                    completionHandler(nil, bookData.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
