//
//  APIClient.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class APIClient {
    static func getGenres(completionHandler: @escaping (AppError?, [Results]?) -> Void) {
        let urlString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.APIKey)"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (error, data) in
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                do {
                    let genres = try JSONDecoder().decode(Genres.self, from: data)
                    completionHandler(nil, genres.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    static func getBooks(keyword: String, completionHandler: @escaping (AppError?, [BookResults]?) -> Void) {
        let urlString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.APIKey)&list=\(keyword)"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (error, data) in
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                do {
                    let books = try JSONDecoder().decode(Books.self, from: data)
                    completionHandler(nil, books.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }

    
}
