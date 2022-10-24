//
//  ModelFile.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 8/23/22.
//

import Foundation

struct Pet: Identifiable, Codable {
    var id: String = UUID().uuidString
    let name: String
    var age: Int?
    var birthDay: Date?
    var weight: Int?
    var gender: String?
    var breed: String?
    var favoriteToys: [String] = []
    var favoriteFood: [String] = []
    var favoriteActivity: [String] = []
    var typeOfAnimal: String?
    var color: String?
    var petImages: [String] = []
    var vaccinationRecords: [String] = []
    var medicalRecords: [String] = []
    var insurance: [String] = []
    var careNotes: [String] = []
    var feedTimes: [Date] = []
    var pottyTimes: [Date] = []
    var supplements: [String] = []
    var socialize: [String] = []
    var training: [String] = []
    var checklist: [String] = []
    
}
