//
//  NetworkHelper.swift
//  NYTBestsellers
//
//  Created by Alex Paul on 1/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NetworkHelper {
    private init() {}
    static let shared = NetworkHelper()
    func performDataTask(endpointURLString: String, handler: @escaping (AppError?, Data?) -> Void) {
        guard let url = URL(string: endpointURLString) else {
            handler(AppError.badURL(endpointURLString), nil)
            return
        }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                handler(AppError.networkError(error), nil)
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -999
                    handler(AppError.badStatusCode(String(statusCode)), nil)
                    return
            }
            if let data = data {
                handler(nil, data)
            }
        }
        task.resume()
    }
}
