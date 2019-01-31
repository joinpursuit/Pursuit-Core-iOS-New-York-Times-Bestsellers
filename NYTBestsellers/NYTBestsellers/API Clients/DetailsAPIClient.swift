//
//  DetailsAPIClient.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class DetailsAPIClient {
    static func getDetails(completionHandler: @escaping(AppError?, [BookData]?) -> Void) {
        let URL = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=VRCqUABJm6VlDSFA0TBGv726eRp2RN2t&list=Combined-Print-and-E-Book-Fiction"
        NetworkHelper.shared.performDataTask(endpointURLString: URL) { (appError, data) in
            if let data = data {
                do {
                let data = try JSONDecoder().decode(NYTBestsellerCollection.self, from: data)
                         completionHandler(nil, data.results)
                } catch {
                         completionHandler(AppError.jsonDecodingError(error), nil)
                    print("here1")
                }
                if let appError = appError {
                    completionHandler(appError, nil)
                    print("here2")
                }
            }
        }
        
    }
}
