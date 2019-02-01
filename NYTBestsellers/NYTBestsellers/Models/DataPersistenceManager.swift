//
//  DataPersistenceManager.swift
//  NYTBestsellers
//
//  Created by Ramu on 1/31/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class DataPersistenceManager {
    private init() {}
    
    static func documentsDirectory() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    // to create a path with a filename to the documents directory
    static func filenameFromDoucmentsDirectory(filename: String) -> URL {
        return documentsDirectory().appendingPathComponent(filename)
    }
    
}
