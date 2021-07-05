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
  
  private static var cache = NSCache<NSString, UIImage>()
  
    private static let mainImagePath: URL = URL(fileURLWithPath: "")
    
  static func fetchImage(urlString: String, completion: @escaping (AppError?, UIImage?) -> Void) {
    if let image = fetchImageFromDisk(imageUrl: urlString) {
        completion(nil, image)
        return
    }
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
  
  static func fetchImageFromCache(urlString: String) -> UIImage? {
    return cache.object(forKey: urlString as NSString)
  }

    static func saveImageToDisk(image: UIImage, imageUrl: String) {
        let path = mainImagePath.appendingPathComponent(imageUrl.filter { CharacterSet.alphanumerics.contains($0.unicodeScalars.first!) } )
        do {
            try image.jpegData(compressionQuality: 0.5)?.write(to: path)
        }
        catch {
            print(error)
        }
    }
    
    private static func fetchImageFromDisk(imageUrl: String) -> UIImage? {
        return nil
    }
}
