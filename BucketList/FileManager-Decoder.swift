//
//  FileManager-Codable.swift
//  BucketList
//
//  Created by Scott Obara on 21/2/21.
//

import Foundation

extension FileManager {
    
    func getDocumentsDirectory() -> URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    func decode<T: Codable>(_ file: String) -> T {
        
        let url = self.getDocumentsDirectory().appendingPathComponent(file)
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()

        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)

        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
    
//    func encode<T: Codable>(_ file: String) -> T {
//
//        let url = self.getDocumentsDirectory().appendingPathComponent(file)
//
//        guard let data = try? Data(contentsOf: url) else {
//            fatalError("Failed to load \(file) from bundle.")
//        }
//
//        let decoder = JSONEncoder()
//
//        let formatter = DateFormatter()
//        formatter.dateFormat = "y-MM-dd"
//        decoder.dateDecodingStrategy = .formatted(formatter)
//
//        guard let loaded = try? decoder.decode(T.self, from: data) else {
//            fatalError("Failed to decode \(file) from bundle.")
//        }
//
//        return loaded
//    }
}
