//
//  BookModel.swift
//  NYTBestsellers
//
//  Created by Aaron Cabreja on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


final class BookModel {
    private static let filename = "BestSellerBooks.plist"
    private static var books = BookModel.getBook()
    //making the initializer private
    
    static func getBook() -> [Book]{
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        var bookFavorites = [Book]()
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do {
                    bookFavorites =  try PropertyListDecoder().decode([Book].self, from: data)
                } catch {
                    print("property list deccoding error: \(error)")
                }
            } else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return bookFavorites
    }
    static func addBook(book: Book) {
        books.append(book)
        save()
    }
    
    static func delete(atIndex index: Int) {
        books.remove(at: index)
        save()
    }
    
    static func save() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(books)
            
            try data.write(to: path, options: Data.WritingOptions.atomic)
            
        } catch {
            print("property list encoding error: \(error)")
        }
        print(DataPersistenceManager.filepathToDocumentsDirectory(filename: filename))
    }
    
    static func updateItem(updatedItem: Book, atIndex index: Int) {
        books[index] = updatedItem
        save()
    }
}
