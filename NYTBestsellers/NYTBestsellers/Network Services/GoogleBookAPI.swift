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
    static func getGoogleInfo(bookIsbn: String, completionHandler: @escaping (AppError?, String?) -> Void) {
        
        let endpointURLString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(bookIsbn)&key=\(SecretKeys.googleKey)"
        
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
                    let googleInfo = try JSONDecoder().decode(VolumeInfo.self, from: data)
                    completionHandler(nil, googleInfo.imageLinks.first?.thumbnail)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }.resume()
    }

}
