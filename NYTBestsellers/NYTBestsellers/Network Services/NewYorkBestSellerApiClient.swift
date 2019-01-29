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
    static func searchForBestSellingBooks(callBack: @escaping(AppError?, [Category]?) -> Void){
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretInfo.nybsSecretKey)") { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
                callBack(appError, nil)
            }
            if let data = data {
                do {
                    let bestSellerBooks = try JSONDecoder().decode(NewYorkTimesData.self, from: data)
                    callBack(nil, bestSellerBooks.results)
                } catch {
                    callBack(AppError.jsonDecodingError(error), nil)
                }
            }
            
        }
    }
    
    static func getBestSellerByCategory(category: String, callBack: @escaping(AppError?, AllBooksByCatergoryData?) -> Void){
        let formattedStr = category.replacingOccurrences(of: " ", with: "+")
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretInfo.nybsSecretKey)&list=\(formattedStr)") { (appError, data) in
            if let appError = appError {
                print(appError.errorMessage())
                callBack(appError, nil)
            }
            if let data = data {
                do {
                    let onlineBooksByCategory =  try JSONDecoder().decode(AllBooksByCatergoryData.self, from: data)
                    callBack(nil, onlineBooksByCategory)
                    print("Number of results in this category are \(onlineBooksByCategory.numberOfBookResults)")
                } catch {
                    callBack(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
