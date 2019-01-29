//
//  NYTAPIClient.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


final class NYTAPIClient{
    static func getGenre(completionHandler: @escaping (AppError?, [ListNames]?) -> Void) {
        let getGenreEndpoint = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.NYTAPIKey)"
        NetworkHelper.shared.performDataTask(endpointURLString: getGenreEndpoint) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do {
                    let genre = try JSONDecoder().decode(Genre.self, from: data)
                    completionHandler(nil,genre.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    static func getBooks(keyword: String, completionHandler: @escaping (AppError?, [Book]?) -> Void) {
        let getBookEndpoint = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.NYTAPIKey)&list=\(keyword)"
        NetworkHelper.shared.performDataTask(endpointURLString: getBookEndpoint) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do {
                    let books = try JSONDecoder().decode(Books.self, from: data)
                    completionHandler(nil,books.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
