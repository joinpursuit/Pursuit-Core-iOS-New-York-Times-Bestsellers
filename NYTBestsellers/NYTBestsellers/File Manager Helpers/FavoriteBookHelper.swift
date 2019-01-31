//
//  FavoriteBookHelper.swift
//  NYTBestsellers
//
//  Created by Ashli Rankin on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class PersistanceHelper{
  private static let filename = "Book.plist"
  private static var books = [NewBookCodable]()
  static func getFavBooks() ->[NewBookCodable]{
    let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
    if FileManager.default.fileExists(atPath: path){
      if let data = FileManager.default.contents(atPath: path){
        do{
          books = try PropertyListDecoder().decode([NewBookCodable].self, from: data)
        }catch{
          print("no entries found")
        }
      }
    }else{
      print("\(filename) does not exist")
    }
    return books
  }
  static func addItemsToDirectory(entry:NewBookCodable){
    books.append(entry)
    saveItemToDirectory()
  }
  
  static func saveItemToDirectory(){
    let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
    do{
      let data = try PropertyListEncoder().encode(books)
      try data.write(to: path, options: Data.WritingOptions.atomic)
    } catch{
      print("propertyList encoding error")
    }
  }
  static func deleteItemsFromDirectory(newBook:NewBookCodable,index:Int){
    books.remove(at: index)
    saveItemToDirectory()
  }
  static func updatesTheDirectory(item:NewBookCodable,index:Int){
    books.insert(item, at: index)
    saveItemToDirectory()
  }
}
