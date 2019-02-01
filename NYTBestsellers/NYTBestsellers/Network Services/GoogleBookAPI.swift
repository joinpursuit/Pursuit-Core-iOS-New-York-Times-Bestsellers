//
//  GoogleBookAPI.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class GoogleBookAPI {
    
    private init() {}
    static func getGoogleInfo(bookIsbn: String, completionHandler: @escaping (AppError?, [Items]?) -> Void) {
        
        let endpointURLString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(bookIsbn)&key=\(SecretKeys.googleKey)"

        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let googleData = try JSONDecoder().decode(GoogleModel.self, from: data)
                    completionHandler(nil, googleData.items)
                    
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
        
//        let endpointURLString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(bookIsbn)&key=\(SecretKeys.googleKey)"
//
//        guard let url = URL(string: endpointURLString) else {
//            completionHandler(AppError.badURL(endpointURLString), nil)
//            return
//        }
//        let request = URLRequest(url: url)
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            if let error = error {
//                completionHandler(AppError.networkError(error), nil)
//            }
//            guard let httpResponse = response as? HTTPURLResponse,
//                (200...299).contains(httpResponse.statusCode) else {
//                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
//                    completionHandler(AppError.badStatusCode("\(statusCode)"), nil)
//                    return
//            }
//            if let data = data {
//                do {
//                    let googleInfo = try JSONDecoder().decode(GoogleModel.self, from: data)
//                    completionHandler(nil, googleInfo.items.first?.volumeInfo.imageLinks.thumbnail
//                    )
//                } catch {
//                    completionHandler(AppError.jsonDecodingError(error), nil)
//                }
//            }
//        }.resume()
    }
}
