//
//  SavedModel.swift
//  NYTBestsellers
//
//  Created by Stephanie Ramirez on 1/27/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class FavoriteModel {
    private static let filename = "SavedBookList.plist"
    private static var favorites = [FavoriteBook]()
    private init() {}
    static func appendBook(favorite: FavoriteBook) {
        favorites.append(favorite)
        saveBook()
    }
    static func bookAlreadyFavorited(newTitle: String)-> Bool {
        //itterate through array of favorites and check if title matches
        var title = false
        if favorites.isEmpty {
            return title
        } else {
            for num in 0...favorites.count - 1 {
                if favorites[num].title == newTitle {
                    title = true
                }
            }
        }
        return title
    }
    
    static func saveBook() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        
        do {
            let data = try PropertyListEncoder().encode(favorites)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoder: \(error)")
        }
    }
    static func deleteBook(index: Int) {
        favorites.remove(at: index)
        saveBook()
    }
    static func getBooks() -> [FavoriteBook] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    favorites = try PropertyListDecoder().decode([FavoriteBook].self, from: data)
                } catch {
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        favorites = favorites.sorted {$0.createdAt > $1.createdAt}
        
        return favorites
    }
    
    
}
