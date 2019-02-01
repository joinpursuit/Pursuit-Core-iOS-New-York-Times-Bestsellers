//
//  NYTBestsellersBookDataManager.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class NYTBestsellersBookDataManager {
    private init() {}

private static let filename = "FavoriteBooks.plist"
var book = [FavoriteBooks]()
    static public func fetchFavoriteBooksFromDocumentDirectory() -> [FavoriteBooks] {
         var book = [FavoriteBooks]()
        let path = DataPersistenceManager.filenameToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
           
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    book = try PropertyListDecoder().decode([FavoriteBooks].self, from: data)
                } catch {
                    print("property list encoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        }
       return book
}
    static public func saveToDocumentDirectory(newFavoriteBook: FavoriteBooks) -> (success: Bool, error: Error?) {
        var favoriteBook = fetchFavoriteBooksFromDocumentDirectory()
        favoriteBook.append(newFavoriteBook)
        let path = DataPersistenceManager.filenameToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(favoriteBook)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
            return (false, error)
        }
        return (true, nil)
    }
    
    static func delete(favoriteBook: FavoriteBooks, atIndex index: Int) {
        var favoriteBooks = fetchFavoriteBooksFromDocumentDirectory()
        favoriteBooks.remove(at: index)
        
        let path = DataPersistenceManager.filenameToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(favoriteBooks)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
        
    }

}
