//
//  APIClients.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class APIClient {
    static func getGenres(completionHandler: @escaping(AppError?, [BestsellerGenre]?) -> Void) {
        let url = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=wlkeW3pD0pUSGetw4xoQJPqE96hcoGOx"
        NetworkHelper.shared.performDataTask(endpointURLString: url) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let data = try JSONDecoder().decode(Genre.self, from: data)
                    completionHandler(nil, data.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
            
            
        }
        
    }
    
}
