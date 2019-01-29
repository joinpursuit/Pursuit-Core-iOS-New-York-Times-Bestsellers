//
//  NYTBookAPI.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTBookAPI {
    
    private init() {}
    static func getBookCategories(completionHandler: @escaping (AppError?, [CategoryResults]?) -> Void) {
        
        let endpointURLString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.bookKey)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let categoryInfo = try JSONDecoder().decode(CategoryModel.self, from: data)
                    completionHandler(nil, categoryInfo.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    static func bookResults(listName: String, completionHandler: @escaping (AppError?, [BookResults]?) -> Void) {

        //listName use encoded
        let endpointURLString = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.bookKey)&list=\(listName)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let bookInfo = try JSONDecoder().decode(BookModel.self, from: data)
                    
                    completionHandler(nil, bookInfo.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
            }
    }
}
