//
//  NYTAPIClient.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/28/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTAPIClient {
    private init() {}
    static func getBook(completionHandler: @escaping (AppError?, [Books]?) -> Void)
    {
        //let bookCategory = book.replacingOccurrences(of: " ", with: "-")
        NetworkHelper.shared.performDataTask(endpointURLString: "https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=VRCqUABJm6VlDSFA0TBGv726eRp2RN2t") { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            }
            if let data = data {
                do {
                    let bookData = try JSONDecoder().decode(NYTBestseller.self, from: data)
                    completionHandler(nil, bookData.results)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }

static func fetchBookDetails (category: String,completionHandler: @escaping(Error?, NYTBestseller?) -> Void) {
    
    let endpoint = "https://api.nytimes.com/svc/books/v3/lists.json?api-key=VRCqUABJm6VlDSFA0TBGv726eRp2RN2t=\(category.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)"
    
    NetworkHelper.shared.performDataTask(endpointURLString: endpoint) { (error, data) in
        if let error = error {
            completionHandler(error, nil)
        } else if let data = data {
            do {
                let book = try JSONDecoder().decode(NYTBestseller.self, from: data)
                completionHandler(nil,book)
            } catch {
                completionHandler(error, nil)
                print("Decoding error: \(error)")
            }
        }
    }
    
}
    static func getGoogleInfo(isbn: String, completionHandler: @escaping (Error?, NYTBestSellersDetail?) -> Void) {
        let endpoint = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)&key=AIzaSyCKiGDv9pXIoGYkKMhf_9rpNfDRlOvP1RI"
        NetworkHelper.shared.performDataTask(endpointURLString: endpoint) { (error, data) in
            if let error = error {
                completionHandler(error, nil)
            } else if let data = data {
                do {
                    let details = try JSONDecoder().decode(NYTBestSellersDetail.self, from: data)
                    
                    completionHandler(nil, details)
                } catch {
                    completionHandler(error, nil)
                    print("error")
                }
            }
        }
    }

static func getCoverImages(isbn: String, completionHandler: @escaping(Error?, BookImage?) -> Void){
    let endpoint = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbn)&key=AIzaSyCKiGDv9pXIoGYkKMhf_9rpNfDRlOvP1RI"
    NetworkHelper.shared.performDataTask(endpointURLString: endpoint) { (error, data) in
        if let error = error {
            completionHandler(error, nil)
        } else if let data = data {
            do {
                let coverImage = try JSONDecoder().decode(NYTBestSellersDetail.self, from: data)

                completionHandler(nil, coverImage.items?.first?.volumeInfo.imageLinks)
            } catch {
                completionHandler(error, nil)
                print("error")
            }
        }
    }
}
}
