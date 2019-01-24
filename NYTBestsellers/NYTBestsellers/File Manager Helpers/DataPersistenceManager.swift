//
//  DataPersistenceManager.swift
//  NYTBestsellers
//
//  Created by Alex Paul on 1/24/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


final class DataPersistenceManager {
  private init() {}
  
  static func documentsDirectory() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
  
  static func filepathToDocumentsDirectory(filename: String) -> URL {
    return documentsDirectory().appendingPathComponent(filename)
  }
}
