//
//  APIClient.swift
//  NYTBestsellers
//
//  Created by Joshua Viera on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

class APIClient{
    static func getListNames(completionHandler: @escaping (AppError?, [BookListName.resultsWrapper]?) -> Void ) {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.APIKey)") { (appError, data) in
            if appError != nil {
                completionHandler(AppError.badURL("Bad URL"), nil)
            }
            if let data = data {
                do{
                    let bookData = try JSONDecoder().decode(BookListName.self, from: data)
                    completionHandler(appError, bookData.results)
                }catch{
                    completionHandler(appError, nil)
                }
            }
        }
    }
    
}
