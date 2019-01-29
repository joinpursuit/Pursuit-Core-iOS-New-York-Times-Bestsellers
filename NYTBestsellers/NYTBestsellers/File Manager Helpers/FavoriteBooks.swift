//
//  FavoriteBooks.swift
//  NYTBestsellers
//
//  Created by Biron Su on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
final class FavoriteBookModel {
    private static let filename = "FavoriteBooks.plist"
    static var favoriteBooks = [FavoriteBook]()
    
    private init() {}
    
    static func saveBook() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(favoriteBooks)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("Property list encoding error \(error)")
        }
    }
    static func addBook(book: FavoriteBook) {
        favoriteBooks.append(book)
        saveBook()
    }
    static func getBooks() -> [FavoriteBook] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    favoriteBooks = try PropertyListDecoder().decode([FavoriteBook].self, from: data).sorted(by: {$0.createdAt > $1.createdAt})
                } catch {
                    print("Property list decode error: \(error)")
                }
            } else {
                print("Data does not exist...")
            }
        } else {
            print("\(filename) does not exist...")
        }
        return favoriteBooks
    }
    static func deleteFavoriteBook(index: Int) {
        favoriteBooks.remove(at: index)
        saveBook()
    }
}
