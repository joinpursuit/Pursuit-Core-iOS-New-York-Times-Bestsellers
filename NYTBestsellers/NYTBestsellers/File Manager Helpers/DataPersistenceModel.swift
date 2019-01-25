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
    private static var listNames = [BookListName.resultsWrapper]()
    
    
    static func save(data: [BookListName.resultsWrapper]){
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: listFilename)
        do {
            let data = try PropertyListEncoder().encode(data)
            try data.write(to: path, options: .atomic)
        } catch {
            print("Property list encoding error \(error)")
        }
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
