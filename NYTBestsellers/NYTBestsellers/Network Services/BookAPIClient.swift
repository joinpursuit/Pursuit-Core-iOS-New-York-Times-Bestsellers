//
//  BookAPIClient.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/26/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class BookAPIClient {
    
    static func BookCategories(completionHandler: @escaping (Error?, [BookCategories]?) -> Void){
        
        let imageEndpoint = "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=\(SecretKeys.BookCategoryKey)"
        NetworkHelper.shared.performDataTask(endpointURLString: imageEndpoint) { (error, data) in
            if let error = error {
                completionHandler(error,nil)
            } else if let data = data {
                do {
            let bookCategory = try JSONDecoder().decode(Category.self, from: data)
                    completionHandler(nil,bookCategory.results)
                } catch {
                    completionHandler(error,nil)
                    
                }
            }
        }
    }
        
static func BookCoverImage(Isbn: String, completionHandler: @escaping(Error?, VolumeInformations?)-> Void) {
    let endpoint = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(Isbn)&key=\(SecretKeys.BookCoverImage)"
NetworkHelper.shared.performDataTask(endpointURLString: endpoint) { (error, imagelink) in
        if let error = error {
            completionHandler(error, nil)
        } else if let image = imagelink {
            do {
        let bookCoverImage = try JSONDecoder().decode(BookInfo.self, from:image)
                completionHandler(nil, bookCoverImage.items.first?.volumeInfo)
            } catch {
                completionHandler(error, nil)
            }
        }
    }
    
        }
  
    static func BookDetail(categoryName: String, completionHandler: @escaping(Error?,BookDetails?) -> Void) {
    
        let endpoint = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=\(SecretKeys.BookKey)&list=\(categoryName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"
        NetworkHelper.shared.performDataTask(endpointURLString: endpoint) { (error, data) in
            if let error = error {
                completionHandler(error,nil)
            } else if let data = data {
                do {
                    let book = try JSONDecoder().decode(BookDetails.self,from: data)
                    completionHandler(nil,book)
                } catch {
                completionHandler(error, nil)
                    print("Decoding error \(error)")
                }
            }
        }
        
        
    }
}
    



