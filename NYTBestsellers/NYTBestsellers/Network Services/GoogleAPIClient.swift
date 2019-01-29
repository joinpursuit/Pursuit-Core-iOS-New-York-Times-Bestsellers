//
//  GoogleAPIClient.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class GoogleAPIClient {
    static func getImage(keyword: String, completionHandler: @escaping (AppError?, [Info]?) -> Void) {
        let getImageEndpoint = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(keyword)&key=\(SecretKeys.GoogleAPI)"
        NetworkHelper.shared.performDataTask(endpointURLString: getImageEndpoint) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do {
                    let images = try JSONDecoder().decode(Items.self, from: data)
                    completionHandler(nil,images.items)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
