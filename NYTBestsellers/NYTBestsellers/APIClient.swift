//
//  APIClient.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct APIClient {
    
    static func getListNames(completionHandler: @escaping (AppError?, [BookListName.resultsWrapper]?) -> Void ) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.bestSellersAPIKey)") { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do{
                    let bookData = try JSONDecoder().decode(BookListName.self, from: data)
                    
                    completionHandler(appError, bookData.results)
                }catch{
                    completionHandler(appError, nil)
                }
            }
        }
    }
    static func getBookDetails(listName: String, completionHandler: @escaping (AppError?, [BestSellerBook.ResultsWrapper]?) -> Void ) {
        let listName = listName.replacingOccurrences(of: " ", with: "-")
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.bestSellersAPIKey)&list=\(listName)") { (appError, data) in
            if let appError = appError{
                completionHandler(appError, nil)
            }
            if let data = data{
                do{
                   let bookData = try JSONDecoder().decode(BestSellerBook.self, from: data)
                   completionHandler(appError, bookData.results)
                }catch{
                   completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
