//
//  BestSellersAPIClient.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

final class bookAPIClient {
    static func getBooksCategory(completionhandler: @escaping(AppError?, [Results]?) -> Void) {
    let url = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(APIKey.Key)"
        NetworkHelper.shared.performDataTask(endpointURLString: url) { (appError, data) in
            if let appError = appError {
                completionhandler(appError, nil)
            } else if let data = data {
                do {
                    let bookData = try JSONDecoder().decode(NYTModel.self, from: data)
                    completionhandler(nil, bookData.results)

                } catch {
                    completionhandler(appError, nil)
                }
            }
        }
    }
    
    static func getBookNames(keyword: String , completionhandler: @escaping(AppError?, [BookResults]?) -> Void) {
        let url = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(APIKey.Key)&list=\(keyword)"
        NetworkHelper.shared.performDataTask(endpointURLString: url) { (error, data) in
            if let error = error {
           completionhandler(error,nil)
                print(error)
            } else if let data = data {
                do {
                    let results = try JSONDecoder().decode(Books.self, from: data)
                    completionhandler(nil,results.results)
                } catch {
                    completionhandler(error as? AppError,nil)
                    print(error)
                }
            }
        }
    }
    
    
    static func getImageURL(identifier: String , completionhandler: @escaping(AppError?, VolumeInfo?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://www.googleapis.com/books/v1/volumes?q=\(identifier)&key=\(APIKey.GKey)") { (appError, data) in
            if let appError = appError {
                completionhandler(appError,nil)
            } else if let data = data {
                do {
                   let books = try JSONDecoder().decode(GoogleBooks.self, from: data)
                    completionhandler(nil,books.items.first?.volumeInfo)
                } catch {
                    
                }
            }
        }
    }
}

