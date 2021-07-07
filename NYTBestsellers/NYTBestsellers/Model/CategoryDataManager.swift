//
//  CategoryDataManager.swift
//  NYTBestsellers
//
//  Created by Ibraheem rawlinson on 1/29/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class CategoryDataManager {
    private static let fileName = "Categories.plist"
    public static func fetchCategoriesFromDocumentsDirectory() -> [Category] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName).path
        var categories = [Category]()
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    categories = try PropertyListDecoder().decode([Category].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("data is nil at \(path)")
            }
        } else {
            print("\(fileName) does not exist")
        }
        return categories
    }
    
    public static func saveCategoriesToDocumentsDirectory(categories: [Category]) {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: fileName)
        do {
            let data = try PropertyListEncoder().encode(categories)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
}
