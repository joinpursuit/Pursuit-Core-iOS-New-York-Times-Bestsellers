//
//  Date+Extensions.swift
//  NYTBestsellers
//
//  Created by Alex Paul on 1/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

extension Date {
  // get an ISO timestamp
    //eg let timestamp = Date().getISOTimestamp()     
  static func getISOTimestamp() -> String {
    let isoDateFormatter = ISO8601DateFormatter()
    let timestamp = isoDateFormatter.string(from: Date())
    return timestamp
  }
}
