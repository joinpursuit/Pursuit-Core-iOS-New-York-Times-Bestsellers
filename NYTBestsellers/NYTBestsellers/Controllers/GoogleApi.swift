//
//  GoogleApi.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class GoogleApi {
    private init(){}
    static func searchForBookCovers(isbnNumber: String, callBack: @escaping(Error?, VolumeInfoData?)->Void){
        let endpoint = "https://www.googleapis.com/books/v1/volumes?q=isbn:\(isbnNumber)&key=\(SecretInfo.googleSecretKey)"
        NetworkHelper.shared.performDataTask(endpointURLString: endpoint) { (appError, data) in
            if let appError = appError{
                print(appError.errorMessage())
                callBack(appError, nil)
            }
            if let data = data {
                do {
                    let onlineBookCovers = try JSONDecoder().decode(BookImageData.self, from: data)
                    callBack(nil, onlineBookCovers.items?.first?.volumeInfo)
                } catch {
                    callBack(AppError.jsonDecodingError(error), nil)
                }
            }
        }
    }
}
