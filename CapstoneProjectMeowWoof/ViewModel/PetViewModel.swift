//
//  PetViewModel.swift
//  CapstoneProjectMeowWoof
//
//  Created by luane Niejelski on 9/24/22.
//

import Foundation

//var luna = Pet(name: "Luna", age: 7, birthDay: Date(), weight: 20, gender: "Female",  breed: "Golden Retriever", favoriteToys: ["ball"], typeOfAnimal: "dog", color: "PetAlbum")
//var cali = Pet(name: "Cali", age: 1, birthDay: Date()-2000000000, weight: 20, gender: "Female", breed: "Savannah", favoriteToys: ["Frisco Bird"], typeOfAnimal: "cat", color: "MedicalRecords")
//var zoe = Pet(name: "Zoe", age: 3, birthDay: Date(), weight: 20, gender: "Female", breed: "Syrian", favoriteToys: ["wheel"], typeOfAnimal: "Others", color: "CareNotes")
//var snoop = Pet(name: "Snoop", age: 13, birthDay: Date(),weight: 20, gender: "Female", breed: "Labrador", favoriteToys: ["stick"], typeOfAnimal: "dog", color: "Detailed")


class PetViewModel: ObservableObject {
    
    @Published var pets: [Pet] = [] {
        didSet {
            savePets()
        }
    }
    
    let petKey: String = "pets"
    init() {
        getPets()
    }
    
    
    func getPets() {
        guard
            let data = UserDefaults.standard.data(forKey: petKey),
            let savedPets = try? JSONDecoder().decode([Pet].self, from: data)
        else { return }
        
        self.pets = savedPets
    }
    
    func addFeedTimeToPet(pet: Pet, time: Date) {
        
        let pet = pets.first(where: { $0.id == pet.id } )
        guard var pet = pet else { return }
        
        pet.feedTimes.append(time)
        
        for index in 0..<pets.count {
            if pet.id == pets[index].id {
                pets[index] = pet
                print(pets[index])
                break
            }
        }
    }
    
    func addPottyTimesToPet(pet: Pet, time: Date) {
        let pet = pets.first(where: { $0.id == pet.id } )
        guard var pet = pet else { return }
        
        pet.pottyTimes.append(time)
        
        for index in 0..<pets.count {
            if pet.id == pets[index].id {
                pets[index] = pet
                print(pets[index])
                break
            }
        }
    }
    
    func addWalkingTimesToPet(pet: Pet, time: Date) {
        let pet = pets.first(where: { $0.id == pet.id } )
        guard var pet = pet else { return }
        
        pet.walkingTimes.append(time)
        
        for index in 0..<pets.count {
            if pet.id == pets[index].id {
                pets[index] = pet
                print(pets[index])
                break
            }
        }
    }
    
    func addTrainingToPet(pet: Pet, training: Training) {
        let pet = pets.first(where: { $0.id == pet.id } )
        guard var pet = pet else { return }
        
        pet.training.append(training)
        
        for index in 0..<pets.count {
            if pet.id == pets[index].id {
                pets[index] = pet
                print(pets[index])
                break
            }
        }
    }
    
    func addCareNotesToPet(pet: Pet, careNotes: String ) {
        guard
            let data = UserDefaults.standard.data(forKey: petKey),
         let savePets = try? JSONDecoder().decode([Pet].self, from: data) else { return }
        self.pets = savePets
    }
    
    func updatePetInfo(
        id: String,
        birthDay: Date? = nil,
        weight: Int? = nil,
        gender: String? = nil,
        breed: String? = nil,
        favoriteToys: [String]? = nil,
        favoriteFood: [String]? = nil,
        favoriteActivity:[String]? = nil,
        typeOfAnimal: String? = nil,
        color: String? = nil) {
            
            let pet = pets.first(where: { $0.id == id } )
            guard var pet = pet else { return }
            
            if birthDay != nil {
                pet.birthDay = birthDay
            }
            
            if weight != nil {
                pet.weight = weight
            }
            
            if gender != nil {
                pet.gender = gender
            }
            
            if breed != nil {
                pet.breed = breed
            }
            
            if favoriteToys != nil {
                pet.favoriteToys += favoriteToys ?? []
            }
            
            if favoriteActivity != nil {
                pet.favoriteActivity += favoriteActivity ?? []
            }
            
            if favoriteFood != nil {
                pet.favoriteFood += favoriteFood ?? []
            }
            
            if typeOfAnimal != nil {
                pet.typeOfAnimal = typeOfAnimal
            }
            
            if  color != nil {
                pet.color = color
            }
            
            for index in 0..<pets.count {
                if pet.id == pets[index].id {
                    pets[index] = pet
                    print(pets[index])
                    break
                }
            }
        }
    
    func addPet(pet: Pet?) {
        if let pet = pet {
            pets.append(pet)
        }
    }
    
    func savePetImage(pet: Pet, id: String) {
        let pet = pets.first(where: { $0.id == pet.id } )
        guard var pet = pet else { return }
        
        pet.petPhotos.append(id)
        
        for index in 0..<pets.count {
            if pet.id == pets[index].id {
                pets[index] = pet
                print(pets[index])
                break
            }
        }
    }
    
    func saveInsuranceImage(pet: Pet, id: String) {
        let pet = pets.first(where: { $0.id == pet.id } )
        guard var pet = pet else { return }
        
        pet.petInsuranceDocuments.append(id)
        
        for index in 0..<pets.count {
            if pet.id == pets[index].id {
                pets[index] = pet
                print(pets[index])
                break
            }
        }
    }
    
    func saveMedicalDocumentsImage(pet: Pet, id: String) {
        let pet = pets.first(where: { $0.id == pet.id } )
        guard var pet = pet else { return }
        
        pet.petMedicalRecords.append(id)
        
        for index in 0..<pets.count {
            if pet.id == pets[index].id {
                pets[index] = pet
                print(pets[index])
                break
            }
        }
    }
    
    func saveVaccinationDocumentsImage(pet: Pet, id: String) {
        let pet = pets.first(where: { $0.id == pet.id } )
        guard var pet = pet else { return }
        
        pet.petVaccinationRecords.append(id)
        
        for index in 0..<pets.count {
            if pet.id == pets[index].id {
                pets[index] = pet
                print(pets[index])
                break
            }
        }
    }
    
    func savePets() {
        if let encodedData = try? JSONEncoder().encode(pets) {
            UserDefaults.standard.set(encodedData, forKey: petKey)
        }
    }
}




//var listOfPets: [Pet] = [luna, cali, zoe, snoop]
//
//func appendingPetToList(pet: Pet) {
//    listOfPets.append(pet)
//}
//
//func printElements(list: [Pet]) {
//    for pet in listOfPets where pet.favoriteToys != nil {
//        print(pet)
//    }
//}
