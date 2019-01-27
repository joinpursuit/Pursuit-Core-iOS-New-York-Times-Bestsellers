//
//  CategoriesAPIClient.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class Categories {

  static func getCategoriesData(completionHandler: @escaping (AppError?, [BookCategories]?) -> Void){
    
    let urlString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(Constants.nytKey)"
    
    
    NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (appError, data) in
      if let appError = appError {
        completionHandler(appError, nil)
      }
      if let data = data {
        do {
          let categoryData = try JSONDecoder().decode(NYTCategories.self, from: data)
          completionHandler(nil, categoryData.results)
        } catch {
          
        }
      }
    }

  }
  
}
