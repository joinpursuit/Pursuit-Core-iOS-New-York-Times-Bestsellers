//
//  CategoryDataManager.swift
//  NYTBestsellers
//
//  Created by Donkemezuo Raymond Tariladou on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation


final class CategoryDataManager {
    
    private static let fileName = "Categories.plist"
    
    public static func fetchCategoriesFromDocumentsDirectory() -> [BookCategories]{
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName).path
        var categories = [BookCategories]()
        if FileManager.default.fileExists(atPath: path){
            if let data = FileManager.default.contents(atPath: path){
                do {
                    categories = try PropertyListDecoder().decode([BookCategories].self, from: data)
                }catch{
                    print("property list decoding error: \(error)")
                }
            } else {
                print("Data is nill at \(path)")
            }
        } else {
            print("\(fileName) does not exist")
        }
        return categories
    }
    
    
    public static func saveToCategoriesToDocumentsDirectory(categories:[BookCategories]) {
         let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName)
    
        do {
             let data = try PropertyListEncoder().encode(categories)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("Property list encoder error \(error)")
        }
    }
    
}
