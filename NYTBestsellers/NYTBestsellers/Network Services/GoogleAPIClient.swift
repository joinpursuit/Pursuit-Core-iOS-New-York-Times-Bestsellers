//
//  GoogleAPIClient.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class GoogleAPIClient {
    private init() {}
    static func getBookImages (keyword: String, completionHandler: @escaping (AppError?, [BookVolume]?) -> Void) {
        let endpointURLString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(keyword)&key=\(APIKeys.googleKey)"
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
                    let bookImage = try JSONDecoder().decode(GoogleBooks.self, from: data)
                    completionHandler(nil, bookImage.items)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        } .resume()
    }
}
