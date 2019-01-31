//
//  PickerViewDataHelper.swift
//  NYTBestsellers
//
//  Created by Elizabeth Peraza  on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class PickerViewDataHelper {
  
  static let filename = "PickerViewData.plist"
  private static var pickerViewArray = [BookCategories]()
  
  private init() {}
  
  static func savePickerViewCategoriesData(arrayOfCategories: [BookCategories]) {
    let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
    print("I have a path: \(path)")
    
    do{
      let data = try PropertyListEncoder().encode(arrayOfCategories)
      try data.write(to: path, options: Data.WritingOptions.atomic)
    } catch {
      print("property list encoding error: \(error)")
    }
  }
  
  static func getPickerViewCategoriesData() -> [BookCategories] {
    let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
    
    if FileManager.default.fileExists(atPath: path) {
      if let data = FileManager.default.contents(atPath: path) {
        do {
          pickerViewArray = try PropertyListDecoder().decode([BookCategories].self, from: data)
        } catch {
          print("property list decoding error: \(error)")
        }
      } else {
        print("getFavoriteBooksInfo data: is nil")
      }
    } else {
      print("\(filename) does not exist")
    }
    
    return pickerViewArray
  }
}

