//
//  FavoritesDataManager.swift
//  NYTBestsellers
//
//  Created by Jeffrey Almonte on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class FavoritesDataManager {
    private init() {}
    
    private static let filename = "FavoritesBook.plist"
    
    static public func fetchFavoriteEventsFromDocumentsDirectory() -> [FavoritesBook] {
        var favorites = [FavoritesBook]()
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    favorites = try PropertyListDecoder().decode([FavoritesBook].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return favorites
    }
    
    static public func saveToDocumentDirectory(newFavoriteEvent: FavoritesBook) -> (success: Bool, error: Error?) {
        var favoriteEvents = fetchFavoriteEventsFromDocumentsDirectory()
        favoriteEvents.append(newFavoriteEvent)
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(favoriteEvents)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
            return (false, error)
        }
        return (true, nil)
    }
    
    static func delete(favoriteEvent: FavoritesBook, atIndex index: Int) {
        // get current favorite evnets and remove favorite from index
        var favoriteEvents = fetchFavoriteEventsFromDocumentsDirectory()
        favoriteEvents.remove(at: index)
        
        // save change to documents directory
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(favoriteEvents)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
//    static public func isFavorite(id: String) -> Bool {
//        let index = fetchFavoriteEventsFromDocumentsDirectory().index { $0.id == id }
//        var found = false
//        if let _ = index {
//            found = true
//        }
//        return found
//    }
    
    
}
