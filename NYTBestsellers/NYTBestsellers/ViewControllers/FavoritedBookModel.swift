//
//  FavoritedBookModel.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class FavoritedBookModel {
    
    private static let filename = "FavoritedBook.plist"
    
    private static var favoriteBooks = [FavoriteBook]()
    static func FavoritedBooks(){
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(favoriteBooks)
            try data.write(to: path,options: Data.WritingOptions.atomic)
        }catch {
              print("error encountered while encoding data")
        }
    }
    
    static func getFavoritedBooks() -> [FavoriteBook]{
        
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    favoriteBooks = try PropertyListDecoder().decode([FavoriteBook].self, from: data)
                }catch {
                     print("Property list decoding error: \(error)")
                }
            } else {
                     print("Data is nil")
                }
        } else {
            print("\(filename) does not exist")
        }
    
    
        return favoriteBooks
    
}
    
    static func favorite(Book: FavoriteBook){
        favoriteBooks.append(Book)
    }
    
    
    

}
