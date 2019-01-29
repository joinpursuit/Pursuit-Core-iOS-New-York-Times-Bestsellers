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
    static var favoriteBooks = [Book]()
    
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
    static func addBook(book: Book) {
        favoriteBooks.append(book)
        saveBook()
    }
    static func getBooks() -> [Book] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    favoriteBooks = try PropertyListDecoder().decode([Book].self, from: data)
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
}
