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
    }
}
