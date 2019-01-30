//
//  GoogleAPIClient.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class GoogleAPIClient {
    
    static func getDetails(completionHandler: @escaping (AppError?, [BookInfo]?) -> Void)
    {
        NetworkHelper.shared.performDataTask(endpointURLString: "https://www.googleapis.com/books/v1/volumes?q=isbn:9781524763138&key=AIzaSyCKiGDv9pXIoGYkKMhf_9rpNfDRlOvP1RI") { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let details = try JSONDecoder().decode(NYTBestSellersDetail.self, from: data)
                    completionHandler(nil, details.items)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
