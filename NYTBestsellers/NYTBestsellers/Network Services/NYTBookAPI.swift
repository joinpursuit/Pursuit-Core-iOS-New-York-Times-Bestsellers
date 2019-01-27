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
        
        guard let url = URL(string: endpointURLString) else {
            completionHandler(AppError.badURL(endpointURLString), nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(AppError.networkError(error), nil)
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                    completionHandler(AppError.badStatusCode("\(statusCode)"), nil)
                    return
            }
            if let data = data {
                do {
                    let categoryInfo = try JSONDecoder().decode(CategoryModel.self, from: data)
                    completionHandler(nil, categoryInfo.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
            }.resume()
    }
    static func bookResults(listName: String, completionHandler: @escaping (AppError?, [BookResults]?) -> Void) {

        //listName use encoded
        let endpointURLString = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.bookKey)&list=\(listName)"
        
        guard let url = URL(string: endpointURLString) else {
            completionHandler(AppError.badURL(endpointURLString), nil)
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completionHandler(AppError.networkError(error), nil)
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                    completionHandler(AppError.badStatusCode("\(statusCode)"), nil)
                    return
            }
            if let data = data {
                do {
                    let bookInfo = try JSONDecoder().decode(BookModel.self, from: data)
                    
                    completionHandler(nil, bookInfo.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
            }.resume()
    }
}
