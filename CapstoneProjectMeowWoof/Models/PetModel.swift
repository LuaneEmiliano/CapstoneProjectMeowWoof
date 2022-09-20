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
}

var luna = Pet(name: "Luna", age: 7, birthDay: Date(), weight: 20, gender: "Female",  breed: "Golden Retriever", favoriteToys: ["ball"], typeOfAnimal: "dog")
var cali = Pet(name: "Cali", age: 1, birthDay: Date()-2000000000, weight: 20, gender: "Female", breed: "Savannah", favoriteToys: ["Frisco Bird"], typeOfAnimal: "cat")
var zoe = Pet(name: "Zoe", age: 3, birthDay: Date(), weight: 20, gender: "Female", breed: "Syrian", favoriteToys: ["wheel"], typeOfAnimal: "hamster")
var snoop = Pet(name: "Snoop", age: 13, birthDay: Date(),weight: 20, gender: "Female", breed: "Labrador", favoriteToys: ["stick"], typeOfAnimal: "dog")


var listOfPets: [Pet] = [luna, cali, zoe, snoop]

func appendingPetToList(pet: Pet) {
    listOfPets.append(pet)
}

func printElements(list: [Pet]) {
    for pet in listOfPets where pet.favoriteToys != nil {
        print(pet)
    }
}
