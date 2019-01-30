//
//  NYTAPIClient.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTAPIClient {
    private init() {}
    static func getBook(completionHandler: @escaping (AppError?, [Books]?) -> Void)
    {
        //let bookCategory = book.replacingOccurrences(of: " ", with: "-")
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=VRCqUABJm6VlDSFA0TBGv726eRp2RN2t") { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let bookData = try JSONDecoder().decode(NYTBestseller.self, from: data)
                    completionHandler(nil, bookData.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
