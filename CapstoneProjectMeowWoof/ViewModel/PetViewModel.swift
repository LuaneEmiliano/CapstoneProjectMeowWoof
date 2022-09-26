//
//  PetViewModel.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/24/22.
//

import Foundation

var luna = Pet(name: "Luna", age: 7, birthDay: Date(), weight: 20, gender: "Female",  breed: "Golden Retriever", favoriteToys: ["ball"], typeOfAnimal: "dog", color: "PetAlbum")
var cali = Pet(name: "Cali", age: 1, birthDay: Date()-2000000000, weight: 20, gender: "Female", breed: "Savannah", favoriteToys: ["Frisco Bird"], typeOfAnimal: "cat", color: "MedicalRecords")
var zoe = Pet(name: "Zoe", age: 3, birthDay: Date(), weight: 20, gender: "Female", breed: "Syrian", favoriteToys: ["wheel"], typeOfAnimal: "Others", color: "CareNotes")
var snoop = Pet(name: "Snoop", age: 13, birthDay: Date(),weight: 20, gender: "Female", breed: "Labrador", favoriteToys: ["stick"], typeOfAnimal: "dog", color: "Detailed")


class PetViewModel: ObservableObject {
    
    @Published var pets: [Pet] = []
    
    init() {
        pets = listOfPets
    }
}


var listOfPets: [Pet] = [luna, cali, zoe, snoop]

func appendingPetToList(pet: Pet) {
    listOfPets.append(pet)
}

func printElements(list: [Pet]) {
    for pet in listOfPets where pet.favoriteToys != nil {
        print(pet)
    }
}
