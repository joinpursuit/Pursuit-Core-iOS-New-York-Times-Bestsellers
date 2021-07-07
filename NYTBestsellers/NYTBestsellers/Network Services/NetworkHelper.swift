//
//  NetworkHelper.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

public final class NetworkHelper {
  private init() {
    let cache = URLCache(memoryCapacity: 10 * 1024 * 1024, diskCapacity: 10 * 1024 * 1024, diskPath: nil)
    URLCache.shared = cache
  }
  public static let shared = NetworkHelper()
  
 func performDataTask(endpointURLString: String,
                              httpMethod: String,
                              httpBody: Data?,
                              completionHandler: @escaping (AppError?, Data?, HTTPURLResponse?) ->Void) {
    guard let url = URL(string: endpointURLString) else {
      completionHandler(AppError.badURL("\(endpointURLString)"), nil, nil)
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = httpMethod
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        completionHandler(AppError.networkError(error), nil, response as? HTTPURLResponse)
        return
      } else if let data = data {
        completionHandler(nil, data, response as? HTTPURLResponse)
      }
    }
    task.resume()
  }
  
 func performUploadTask(endpointURLString: String,
                                httpMethod: String,
                                httpBody: Data?,
                                completionHandler: @escaping (AppError?, Data?, HTTPURLResponse?) ->Void) {
    guard let url = URL(string: endpointURLString) else {
      completionHandler(AppError.badURL("\(endpointURLString)"), nil, nil)
      return
    }
    var request = URLRequest(url: url)
    request.httpMethod = httpMethod
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.uploadTask(with: request, from: httpBody) { (data, response, error) in
      if let error = error {
        completionHandler(AppError.networkError(error), nil, response as? HTTPURLResponse)
        return
      } else if let data = data {
        completionHandler(nil, data, response as? HTTPURLResponse)
      }
    }
    task.resume()
  }
}
