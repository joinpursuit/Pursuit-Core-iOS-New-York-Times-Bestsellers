//
//  EventDataManager.swift
//  NYTBestsellers
//
//  Created by Genesis Mosquera on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//
import Foundation

final class BookDataManager {
    private init() {}
    
    private static let filename = "FavoriteBooks.plist"
    
    static public func fetchFavoriteBooksFromDocumentsDirectory() -> [FavoriteBook] {
        
        var books = [FavoriteBook]()
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
       
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    books = try PropertyListDecoder().decode([FavoriteBook].self, from: data)
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
    
    static public func saveToDocumentDirectory(newFavoriteBook: FavoriteBook) -> (success: Bool, error: Error?) {
        var favoriteBooks = fetchFavoriteBooksFromDocumentsDirectory()
        favoriteBooks.append(newFavoriteBook)
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        print(path)
        do {
            let data = try PropertyListEncoder().encode(favoriteBooks)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
            return (false, error)
        }
        return (true, nil)
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
    
    
}
