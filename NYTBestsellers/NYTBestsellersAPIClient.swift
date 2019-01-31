//
//  NYTBestsellersAPIClient.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTBestsellers {
    static func fetchBooks (completionHandler: @escaping(AppError?, [BookCategories]?) -> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=2xiuEfmD2kRImRnbg7kcjeYCergR4PAc") { (error, data) in
            if let appError = error {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let books = try JSONDecoder().decode(NYTBestseller.self, from: data)
                    completionHandler(nil, books.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    
    static func fetchBookDetails (category: String,completionHandler: @escaping(Error?, NYTBestsellersInfo?) -> Void) {
        
        let endpoint = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=2xiuEfmD2kRImRnbg7kcjeYCergR4PAc&list=\(category.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"
        
        NetworkHelper.shared.performDataTask(endpointURLString: endpoint) { (error, data) in
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                do {
                    let book = try JSONDecoder().decode(NYTBestsellersInfo.self, from: data)
                    completionHandler(nil,book)
                } catch {
                completionHandler(error, nil)
                    print("Decoding error: \(error)")
                }
            }
        }
        
    }
    
    
    
    
    static func getCoverImages(isbn: String, completionHandler: @escaping(Error?,[ItemDetails]?) -> Void){
        let endpoint = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)&key=AIzaSyAeolJM4r4yvGeRG_Eyel3CDzRWLBke5TQ"
        NetworkHelper.shared.performDataTask(endpointURLString: endpoint) { (error, data) in
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                do {
                    let bookInfo = try JSONDecoder().decode(BookInfo.self, from: data)
                    let items = bookInfo.items
                    completionHandler(nil, items)
                } catch {
                    completionHandler(error, nil)
                    print("error")
                }
            }
        }
    }
    
    
    
}



