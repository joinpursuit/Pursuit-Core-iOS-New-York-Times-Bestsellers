//
//  APIClient.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

class APIClient{
    static func getListNames(completionHandler: @escaping (AppError?, [BookListName.resultsWrapper]?) -> Void ) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.APIKey)") { (appError, data) in
            if appError != nil {
                completionHandler(AppError.badURL("Bad URL"), nil)
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
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.APIKey)&list=\(listName)") { (appError, data) in
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
    static func getGoogleData(isbn: String, completionHandler: @escaping (AppError?, [BookImage.ItemsWrapper]?) -> Void ) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://www.googleapis.com/books/v1/volumes?q=+isbn:\(isbn)&key=\(SecretKeys.googleAPIKey)") { (appError, data) in
            
            if appError != nil{
                completionHandler(AppError.badURL("Bad URL"), nil)
            }
            if let data = data {
                do{
                    let googleData = try JSONDecoder().decode(BookImage.self, from: data)
                    completionHandler(nil, googleData.items)
                } catch{
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
