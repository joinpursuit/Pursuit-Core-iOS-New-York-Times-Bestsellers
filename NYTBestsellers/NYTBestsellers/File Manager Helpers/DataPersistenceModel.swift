//
//  DataPersistenceModel.swift
//  NYTBestsellers
//
//  Created by Matthew Huie on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct DataPersistenceModel {
    private static let filename = "FavoriteBooks.plist"
    private static var myFavBooks = [FavoriteBooks]()
    private init() {}
    
    static func save(){
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(myFavBooks)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Property list encoding error \(error)")
        }
    }
    
    static func saveBook(book: FavoriteBooks) {
        myFavBooks.append(book)
        save()
    }
    
    static func getFavBooks() -> [FavoriteBooks] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    myFavBooks = try PropertyListDecoder().decode([FavoriteBooks].self, from: data)
                } catch {
                    print("getFavBooks - property list decoding error")
                }
            } else {
                print("getFavBooks - data is nil")
            }
        } else {
            print("getFavBooks - \(filename) does not exist")
        }
        myFavBooks = myFavBooks.sorted {$0.createdAt.date() > $1.createdAt.date()}
        return myFavBooks
    }
    
    static func delete(index: Int) {
        myFavBooks.remove(at: index)
        save()
    }
    
    
}
