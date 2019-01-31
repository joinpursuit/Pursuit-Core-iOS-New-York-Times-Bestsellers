//
//  APIClients.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class APIClient {
    static func getGenres(completionHandler: @escaping(AppError?, [BestsellerGenre]?) -> Void) {
        let url = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecrectKeys.nytAPIKey)"
        NetworkHelper.shared.performDataTask(endpointURLString: url) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let data = try JSONDecoder().decode(Genre.self, from: data)
                    completionHandler(nil, data.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
            
            
        }
        
    }
    static func getBooks(genre: String, completionHandler: @escaping (AppError?,[Books]?) -> Void) {
        let genreNameFormatted = genre.replacingOccurrences(of: " ", with: "-")
        let url = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecrectKeys.nytAPIKey)&list=\(genreNameFormatted)"
        NetworkHelper.shared.performDataTask(endpointURLString: url) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let bookData = try JSONDecoder().decode(BestsellersBookModel.self, from: data)
                    completionHandler(nil, bookData.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
        
    }
//    static func getGoogleData(isbn: String, completionHandler: @escaping (AppError?,[Books]?) -> Void) {
//        let url = "https://www.googleapis.com/books/v1/volumes?q=isbn:9780425285183&key=AIzaSyDaQm1Xl8ZmC9kQ_uy_mPk9peLpUsaFP9o"
//        NetworkHelper.shared.performDataTask(endpointURLString:url) { (AppError?, Data?) in
//            <#code#>
//        }
//    }
}
