//
//  SavedBookModel.swift
//  NYTBestsellers
//
//  Created by Jane Zhu on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct SavedBookModel {
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
        return savedBooks
    }
    
    static func addBook(book: Book) {
        savedBooks.append(bool)
        
    }
}
