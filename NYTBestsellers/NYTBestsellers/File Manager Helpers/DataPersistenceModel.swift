//
//  DataPersistenceModel.swift
//  NYTBestsellers
//
//  Created by Kevin Waring on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct DataPersistenceModel{
    
    private static let favoriteBooksFilename = "FavoriteBooks.plist"
    
    private static var favoriteBooks = [FavoritedBook]()
    
    
    static func saveBookToFavorites(){
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: favoriteBooksFilename)
        do {
            let data = try PropertyListEncoder().encode(favoriteBooks)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Property list encoding error \(error)")
        }
    }
    static func favoriteBook(favoriteBook: FavoritedBook){
        favoriteBooks.append(favoriteBook)
        saveBookToFavorites()
    }
    
    static func deleteFavoriteBook(atIndex: Int){
        favoriteBooks.remove(at: atIndex)
        saveBookToFavorites()
    }
    static func getFavoriteBooks() -> [FavoritedBook]{
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: favoriteBooksFilename).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do {
                    favoriteBooks = try PropertyListDecoder().decode([FavoritedBook].self, from: data)
                    favoriteBooks = favoriteBooks.sorted{$0.date > $1.date}
                }catch{
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("getPhotoJournal data is nil")
            }
        } else {
            print("\(favoriteBooksFilename) does not exist")
        }
        return favoriteBooks
    }
    
}

