//
//  NewYorkBestSellerApiClient.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class NewYorkBestSellerApiClient {
    private init(){}
    static func searchForBestSellingBooks(callBack: @escaping(AppError?, NewYorkTimesData?) -> Void){
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretInfo.nybsSecretKey)") { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
                callBack(appError, nil)
            }
            if let data = data {
                do {
                    let bestSellerBooks = try JSONDecoder().decode(NewYorkTimesData.self, from: data)
                    callBack(nil, bestSellerBooks)
                } catch {
                    callBack(AppError.jsonDecodingError(error), nil)
                }
            }
            
        }
    }
    
    static func getBestSellerByCategory(category: String, callBack: @escaping(AppError?, [BookDataResultsArray]?) -> Void){
        let formattedStr = category.replacingOccurrences(of: " ", with: "+")
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretInfo.nybsSecretKey)&list=\(formattedStr)") { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
                callBack(appError, nil)
            }
            if let data = data {
                do {
                    let categoryTypeData =  try JSONDecoder().decode(NewYorkTimesData.self, from: data)
                    callBack(nil, categoryTypeData.results)
                    print("Number of results in this category are \(categoryTypeData.numResults)")
                } catch {
                    callBack(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
