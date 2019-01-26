//
//  BooksApiClient.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class BookShelfApiClient {
  private func getBookDetails(completionHandler: @escaping (AppError?,Books?) -> Void){
    NetworkHelper.shared.performDataTask(endpointURLString: SecretKeys.book) { (error, data) in
      if let error = error {}
      if let data = data {}
    }
  }
  private func getCategoryDetails(completionHandler: @escaping (AppError?,Categories?) -> Void){
    
  }
  private func getBookCovers(completionHandler: @escaping (AppError?,BookCovers?) -> Void){
    
  }
}
