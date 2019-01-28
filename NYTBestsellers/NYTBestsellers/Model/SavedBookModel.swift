//
//  SavedBookInfoModel.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct SavedBookInfoModel {
    private static let filename = "BookInfo.plist"
    private static var savedBooks = [SavedBook]()
    
    static func getBooks() -> [SavedBook] {
    let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    savedBooks = try PropertyListDecoder().decode([SavedBook].self, from: data)
                } catch {
                    print("property list decoding error getBooks - \(error)")
                }
            } else {
                print("getBooks - data is nil")
            }
        } else {
            print("\(filename) - does not exist ")
        }
        savedBooks = savedBooks.sorted{ $0.date > $1.date }
        return savedBooks
    }
    
    static func save() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(savedBooks)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    static func addBook(book: SavedBook) {
        savedBooks.append(book)
        save()
    }
    
    static func deleteBook(atIndex: Int) {
        savedBooks.remove(at: atIndex)
        save()
    }
    
}
