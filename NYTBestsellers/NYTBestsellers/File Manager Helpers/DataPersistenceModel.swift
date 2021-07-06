//
//  DataPersistenceModel.swift
//  NYTBestsellers
//
//  Created by Leandro Wauters on 1/25/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct DataPersistenceModel{
    private static let listFilename = "ListNames.plist"
    private static let favoriteBooksFilename = "FavoriteBooks.plist"
    private static var listNames = [BookListName.resultsWrapper]()
    private static var favoriteBooks = [FavoriteBook]()
    
    static func save(data: [BookListName.resultsWrapper]){
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: listFilename)
        do {
            let data = try PropertyListEncoder().encode(data)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Property list encoding error \(error)")
        }
    }
    static func saveBookToFavorites(){
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: favoriteBooksFilename)
        do {
            let data = try PropertyListEncoder().encode(favoriteBooks)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Property list encoding error \(error)")
        }
    }
    static func favoriteBook(favoriteBook: FavoriteBook){
        favoriteBooks.append(favoriteBook)
        saveBookToFavorites()
    }
    
    static func deleteFavoriteBook(atIndex: Int){
        favoriteBooks.remove(at: atIndex)
        saveBookToFavorites()
    }
    static func getFavoriteBooks() -> [FavoriteBook]{
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: favoriteBooksFilename).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do {
                    favoriteBooks = try PropertyListDecoder().decode([FavoriteBook].self, from: data)
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
    static func getListNames() -> [BookListName.resultsWrapper]{
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: listFilename).path
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do {
                    listNames = try PropertyListDecoder().decode([BookListName.resultsWrapper].self, from: data)
                    
                }catch{
                    print("Property list decoding error: \(error)")
                }
            } else {
                print("getPhotoJournal data is nil")
            }
        } else {
            print("\(listFilename) does not exist")
        }
        return listNames
    }
}
