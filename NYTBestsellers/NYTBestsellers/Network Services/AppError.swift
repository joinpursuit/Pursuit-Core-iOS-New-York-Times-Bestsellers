//
//  AppError.swift
//  NYTBestsellers
//
//  Created by Alex Paul on 1/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

enum AppError: Error, CustomStringConvertible {
  case badURL(String)
  case noResponse
  case networkClientError(Error)
  case noData
  case decodingError(Error)
  case encodingError(Error)
  case badStatusCode(Int)
  case badMimeType(String) 
  
 
  var description: String {
    switch self {
    case .decodingError(let error):
      return "\(error)"
    case .badStatusCode(let code):
      return "\(code)"
    case .encodingError(let error):
      return "encoding error: \(error)"
    case .networkClientError(let error):
      return "network error: \(error)"
    case .badURL(let url):
      return "Verify the url \(url)"
    default:
      return "other appError \(self)"
    }
  }
}
