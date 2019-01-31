//
//  APIClient.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


struct APIClient {
    static func getListName(completionHandler: @ escaping (AppError?,
        [Genre]?)-> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.bestSellersCategory)") { (appError, data) in
            if appError != nil {
                completionHandler(AppError.badURL("Bad Url"), nil )
            }
            if let data = data {
                do{
                    let bookData = try JSONDecoder().decode(Results.self, from: data)
                    completionHandler(appError, bookData.results)
                } catch {
                    completionHandler(appError,nil)
                }
            }
        }
    }
    static func getBooks(listName: String, completionHandler: @ escaping (AppError?,
        [Book]?)-> Void) {
        let listName = listName.replacingOccurrences(of:" ", with: "-")
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.bestSellersCategory)&list=\(listName)") { (appError, data) in
            if appError != nil {
                completionHandler(AppError.badURL("Bad Url"), nil )
            }
            if let data = data {
                do{
                    let bookData = try JSONDecoder().decode(Books.self, from: data)
                    completionHandler(appError, bookData.results)
                } catch {
                    completionHandler(appError,nil)
                }
            }
        }
    }
    static func getGoogleData(isbn: String, completionHandler: @ escaping (AppError?,
        [Info]?)-> Void) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)&key=\(SecretKeys.googleKey)") { (appError, data) in
            if appError != nil {
                completionHandler(AppError.badURL("Bad Url"), nil )
            }
            if let data = data {
                do{
                    let bookData = try JSONDecoder().decode(Items.self, from: data)
                    completionHandler(appError, bookData.items)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error),nil)
                }
            }
        }
    }
}
