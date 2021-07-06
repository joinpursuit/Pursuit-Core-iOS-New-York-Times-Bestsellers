//
//  FileManager.swift
//  NYTBestsellers
//
//  Created by Oniel Rosario on 1/30/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class BookDataManager {
    private init() {}
    private static let filename = "FavoriteBooks.plist"
    static public func fetchFavoriteBooksFromDocumentsDirectory() -> [FavoriteBooks] {
        var books = [FavoriteBooks]()
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    books = try PropertyListDecoder().decode([FavoriteBooks].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return books
    }
    @discardableResult
    static public func saveToDocumentDirectory(newFavoriteEvent: FavoriteBooks) -> (success: Bool, error: Error?) {
        var favoriteBooks = fetchFavoriteBooksFromDocumentsDirectory()
        favoriteBooks.append(newFavoriteEvent)
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(favoriteBooks)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
            return (false, error)
        }
        return (true, nil)
    }
    
    static func delete(atIndex index: Int) {
        // get current favorite book and remove favorite from index
        var favoriteBooks = fetchFavoriteBooksFromDocumentsDirectory()
        favoriteBooks.remove(at: index)
        // save change to documents directory
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(favoriteBooks)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    static public func isFavorite(id: String) -> Bool {
        let index = fetchFavoriteBooksFromDocumentsDirectory().index { $0.bookName == id }
        var found = false
        if let _ = index {
            found = true
        }
        return found
    }
}

