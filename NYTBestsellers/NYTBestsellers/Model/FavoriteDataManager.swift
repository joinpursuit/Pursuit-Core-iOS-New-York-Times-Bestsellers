//
//  FavoriteDataManager.swift
//  NYTBestsellers
//
//  Created by Jian Ting Li on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class FavoriteDataManager {
    private init() {}
    private static let filename = "FavoriteBooks.plist"
    
    static public func fetchFavoriteBooksFromDocumentsDirectory() -> [FavoriteBook] {
        var favoriteBooks = [FavoriteBook]()
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    favoriteBooks = try PropertyListDecoder().decode([FavoriteBook].self, from: data)
                } catch {
                    print("Property List Decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(filename) doesn't exist")
        }
        return favoriteBooks
    }
    
    static public func saveToDocumentDirectory(newFavoriteBook: FavoriteBook, completionHandler: (Bool?, Error?) -> Void) {
        var favoriteBooks = fetchFavoriteBooksFromDocumentsDirectory()
        favoriteBooks.append(newFavoriteBook)
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            do {
                let data = try PropertyListEncoder().encode(favoriteBooks)
                try data.write(to: path, options: Data.WritingOptions.atomic)
                completionHandler(true, nil)
            }
        } catch {
            print("Property list encoding error: \(error)")
            completionHandler(false, error)
        }
    }

    static func delete(favoriteBook: FavoriteBook, atIndex index: Int) {
        var favoriteBooks = fetchFavoriteBooksFromDocumentsDirectory()
        favoriteBooks.remove(at: index)
        
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(favoriteBooks)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }

    static public func isFavorite(isbn: String) -> Bool {
        let index = fetchFavoriteBooksFromDocumentsDirectory().index { $0.bookDetails.bookDetails[0].primaryIsbn13 == isbn }
        if let _ = index {
            return true
        }
        return false
    }
}
