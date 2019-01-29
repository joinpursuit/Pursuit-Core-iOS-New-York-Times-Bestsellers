//
//  NYTBestsellingCategoriesAPIClient.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTBestsellingCategoriesAPIClient {
    private init() {}
    
    static func getAllCategories(completionHandler: @escaping (AppError?, [Category]?) -> Void) {
        let endpointURLString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.newYorkTimes)"
        NetworkHelper.shared.performDataTask(endpointURLString: endpointURLString) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data {
                do {
                    let categories = try JSONDecoder().decode(Category.CategoryData.self, from: data)
                    completionHandler(nil, categories.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
    
}
