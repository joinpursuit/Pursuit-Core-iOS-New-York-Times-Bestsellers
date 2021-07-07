//
//  BooksApiClient.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class BookShelfApiClient {
static func getCategoryDetails(completionHandler: @escaping (AppError?,[CategoryInfo]?) -> Void){
  NetworkHelper.shared.performDataTask(endpointURLString: SecretKeys.categoryEndPointString(), httpMethod: "GET", httpBody: nil) { (error, data,response) in
      if let error = error {
completionHandler(AppError.badURL(error.errorMessage()),nil)
      }
      if let data = data {
        do{
        let categories = try JSONDecoder().decode(Categories.self, from: data).results
        print(categories)
        completionHandler(nil,categories)
        } catch{
    completionHandler(AppError.jsonDecodingError(error),nil)
        }
      }
    }
}
  static func getBooksInCategory(category:String,completionHandler: @escaping (AppError?,[Results]?) -> Void){
    NetworkHelper.shared.performDataTask(endpointURLString: SecretKeys.getbooksEndopints(keyword: category.replacingOccurrences(of: " ", with: "%20")), httpMethod: "GET", httpBody: nil) { (error,data, response) in
      if let error = error{
completionHandler(AppError.badURL(error.errorMessage()),nil)
      }
      if let data = data {
        do{
          let books = try JSONDecoder().decode(Books.self, from: data).results
         // dump(books)
          completionHandler(nil,books)
        }catch{
    completionHandler(AppError.jsonDecodingError(error),nil)
        }
      }
    }
  }
  static func getBookCoverInfo(isbn:String,completionHandler: @escaping (AppError?,VolumeInfo?)->Void){
    NetworkHelper.shared.performDataTask(endpointURLString: SecretKeys.getBookCoverUrl(isbn: isbn), httpMethod: "GET", httpBody: nil) { (error, data, response) in
      if let error = error {
    completionHandler(AppError.badURL(error.errorMessage()),nil)
      }
      if let data = data {
        do{
        let bookInfo = try JSONDecoder().decode(BookInfo.self, from: data)
          if let smallThumbnail = bookInfo.items?.first?.volumeInfo {
            print("book url is \(smallThumbnail)")
            completionHandler(nil, smallThumbnail)
          } else {
            print("no smallThumbnail url")
            completionHandler(nil, nil)
          }
        }catch{
  completionHandler(AppError.jsonDecodingError(error),nil)
        }
      }
    }
  }
}
