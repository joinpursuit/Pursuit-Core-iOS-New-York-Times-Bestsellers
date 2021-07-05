//
//  NYTimesAPIClient.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTimesAPIClient {
    private init() {}
    static func getGenre (completionHandler: @escaping (AppError?, [GenreType]?) -> Void) {
        let endpointURLString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(APIKeys.nytKey)"
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
                    let bookGenres = try JSONDecoder().decode(Genre.self, from: data)
                    completionHandler(nil, bookGenres.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        } .resume()
    }
    
    static func getBooks (keyword: String, completionHandler: @escaping (AppError?, [Book]?) -> Void) {
        let endpointURLString = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(APIKeys.nytKey)&list=\(keyword)"
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
                    let bookInfo = try JSONDecoder().decode(Books.self, from: data)
                    completionHandler(nil, bookInfo.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        } .resume()
    }
    
    
}
