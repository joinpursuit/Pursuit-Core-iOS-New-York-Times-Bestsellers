//
//  ImagesAPIClient.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class ImagesAPIClient {
  
  static func getBookImages(isbn: String, completionHandler: @escaping (AppError?, [GoogleAPIGeneralInfo]?) -> Void) {
    
    let imageUrl =  "https://www.googleapis.com/books/v1/volumes?q=\(isbn)&key=\(Constants.googleImageKey)"
    
    NetworkHelper.shared.performDataTask(endpointURLString: imageUrl) { (appError, data) in
      if let appError = appError {
        completionHandler(appError, nil)
      }
      if let data = data {
        do {
          let imageData = try JSONDecoder().decode(ImageForBooks.self, from: data)
          completionHandler(nil, imageData.items)
        } catch {
          completionHandler(AppError.jsonDecodingError(error), nil)
        }
      }
    }
  }
}
