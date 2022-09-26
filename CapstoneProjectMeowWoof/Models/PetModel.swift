//
//  ModelFile.swift
//  MeowWoofPetDiary
//
//  Created by luane Niejelski on 8/23/22.
//

import Foundation

struct Pet: Identifiable {
    var id: String = UUID().uuidString
    let name: String
    var age: Int
    var birthDay: Date
    var weight: Int
    var gender: String
    var breed: String
    var favoriteToys: [String]?
    var favoriteFood: [String]?
    var typeOfAnimal: String
    var color: String
}

