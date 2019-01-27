//
//  BooksAPIClient.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class BooksAPIClient {

  static func getBookData(category: String, completionHandler: @escaping (AppError?, [BookGeneralInfo]?) -> Void) {
    
    let categoryNameFormatted = category.replacingOccurrences(of: " ", with: "-")
    let stringURL = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(Constants.nytKey)&list=\(categoryNameFormatted)"
   
    NetworkHelper.shared.performDataTask(endpointURLString: stringURL) { (appError, data) in
      if let appError = appError {
        completionHandler(appError, nil)
      }
      if let data = data {
        do {
          let bookData = try JSONDecoder().decode(NYTBestSellersModel.self, from: data)
          completionHandler(nil, bookData.results)
        } catch {
          completionHandler(AppError.jsonDecodingError(error), nil)
        }
      }
    }
    
    
  }
  
}
