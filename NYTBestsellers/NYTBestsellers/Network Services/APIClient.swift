//
//  APIClient.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class APIClient {
  static func getGenres(completionHandler: @escaping (Result<[Results]?, AppError>) -> Void) {
    let urlString = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.APIKey)"
    guard let url = URL(string: urlString) else {
      completionHandler(.failure(.badURL(urlString)))
      return
    }
    
    let request = URLRequest(url: url)
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completionHandler(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let genres = try JSONDecoder().decode(Genres.self, from: data)
          completionHandler(.success(genres.results))
        } catch {
          completionHandler(.failure(.decodingError(error)))
        }
        
      }
    }
  }
  
  static func getBooks(keyword: String, completionHandler: @escaping (Result<[BookResults]?, AppError>)  -> Void) {
    let urlString = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.APIKey)&list=\(keyword)"
    guard let url = URL(string: urlString) else {
      completionHandler(.failure(.badURL(urlString)))
      return
    }
    
    let request = URLRequest(url: url)
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completionHandler(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let books = try JSONDecoder().decode(Books.self, from: data)
          completionHandler(.success(books.results))
        } catch {
          completionHandler(.failure(.decodingError(error)))
        }
        
      }
    }
  }
  static func getGoogleImage(keyword: String, completionHandler: @escaping (Result<VolumeInfo?, AppError>) -> Void) {
    let urlString = "https://www.googleapis.com/books/v1/volumes?q=+isbn:\(keyword)&key\(SecretKeys.GoogleKey)"
    guard let url = URL(string: urlString) else {
      completionHandler(.failure(.badURL(urlString)))
      return
    }
    
    let request = URLRequest(url: url)
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completionHandler(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let books = try JSONDecoder().decode(Google.self, from: data)
          completionHandler(.success(books.items?.first?.volumeInfo))
        } catch {
          completionHandler(.failure(.decodingError(error)))
        }
        
      }
    }
  }
  
  
}
