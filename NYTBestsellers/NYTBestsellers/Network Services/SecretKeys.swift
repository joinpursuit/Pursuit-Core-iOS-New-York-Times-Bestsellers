//
//  SecretKeys.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class SecretKeys{
  private static let newYorTimesApiKey = "bogIvzeU9TBP4tcTmC98eJ5I41Hvh7CS"
  
  private static let googleAPIKey = "AIzaSyCzyiQwdPWhWU4qzhz7pFkRI30JNwq3mvA"
  
  private static func categoryEndPointString() -> String {
    let urlString = " https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.newYorTimesApiKey)"
    return urlString
  }
  private static func getbooksEndopints(keyword:String) -> String {
    let urlString = "endpoint 2: https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.newYorTimesApiKey)&list=\(keyword)"
    return urlString
  }
  
  private static func getBookCovers(isbn:String) -> String {
    let urlString = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)&key=\(SecretKeys.googleAPIKey)"
    return urlString
  }
}
