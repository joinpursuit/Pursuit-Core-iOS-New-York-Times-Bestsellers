//
//  ImageHelper.swift
//  NYTBestsellers
//
//  Created by Alex Paul on 1/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

final class ImageHelper {
  private init() {}
//    private static var googleData = [BookImage.ItemsWrapper]()
  private static var cache = NSCache<NSString, UIImage>()
  
  static func fetchImageFromNetwork(urlString: String, completion: @escaping (AppError?, UIImage?) -> Void) {
    NetworkHelper.shared.performDataTask(endpointURLString: urlString) { (appError, data ) in
      if let appError = appError {
        completion(appError, nil)
      } else if let data = data {
        DispatchQueue.global().async {
          if let image = UIImage(data: data) {
            cache.setObject(image, forKey: urlString as NSString)
            DispatchQueue.main.async {
              completion(nil, image)
            }
          }
        }
      }
    }
  }
//    static func getImage(isbn: String) -> String{
//        var imageURL = String()
//        APIClient.getGoogleData(isbn: isbn) { (appError, data) in
//            if let appError = appError {
//                print(appError)
//            }
//            if let data = data{
//
//            }
//        }
//        return imageURL
//    }
  static func fetchImageFromCache(urlString: String) -> UIImage? {
    return cache.object(forKey: urlString as NSString)
  }
}
