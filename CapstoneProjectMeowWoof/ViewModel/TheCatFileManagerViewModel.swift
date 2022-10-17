//
//  FileManager.swift
//  Week09 Homework
//
//  Created by luane Niejelski on 10/15/22.
//

import Foundation
import Combine

public extension FileManager {
    static var documentsDirectoryURL: URL {
        return `default`.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}

class TheCatFileManagerViewModel: ObservableObject {
    let animalJSONURL = URL(fileURLWithPath: "PointsOfInterest",
                            relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
    
    let animalPlistURL = URL(fileURLWithPath: "PointsOfInterest",
                             relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("plist")
    
    
    @Published var meowWoof: [CatModel] = [] {
        didSet {
            saveJSONPointsOfInterest()
            savePListPointsOfInterest()
        }
    }
    
    init() {
        loadJSONPointsOfInterest()
    }
    
    private func loadJSONPointsOfInterest() {
        guard FileManager.default.fileExists(atPath: animalJSONURL.path) else {
            return
        }
        
        let decoder = JSONDecoder()
        
        do {
            let tasksData = try Data(contentsOf: animalJSONURL)
            meowWoof = try decoder.decode([CatModel].self, from: tasksData)
            print(meowWoof.first?.name ?? "No name found")
        } catch let error {
            print(error)
        }
    }
    
    private func loadPListPointsOfInterest() {
        guard FileManager.default.fileExists(atPath: animalPlistURL.path) else {
            return
        }
        
        let decoder = PropertyListDecoder()
        
        do {
            let tasksData = try Data(contentsOf: animalPlistURL)
            meowWoof = try decoder.decode([CatModel].self, from: tasksData)
            print(meowWoof.first?.name ?? "No name found")
        } catch let error {
            print(error)
        }
    }
    
    private func saveJSONPointsOfInterest() {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let tasksData = try encoder.encode(meowWoof)
            
            try tasksData.write(to: animalJSONURL, options: .atomicWrite)
            
        } catch let error {
            print(error)
        }
    }
    
    private func savePListPointsOfInterest() {
        
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        
        do {
            let tasksData = try encoder.encode(meowWoof)
            
            try tasksData.write(to: animalPlistURL, options: .atomicWrite)
            
        } catch let error {
            print(error)
        }
    }
    
}
