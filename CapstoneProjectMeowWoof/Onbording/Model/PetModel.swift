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
    var petVaccinationRecords: [String] = []
    var petMedicalRecords: [String] = []
    var petInsuranceDocuments: [String] = []
    var careNotes: String = ""
    var feedTimes: [Date] = []
    var pottyTimes: [Date] = []
    var supplements: [String] = []
    var walkingTimes: [Date] = []
    var training: [Training] = []
    var petPhotos: [String] = []
    
}

struct Training: Identifiable, Codable {
    var id: String = UUID().uuidString
    var name: String
    var date: Date
}
