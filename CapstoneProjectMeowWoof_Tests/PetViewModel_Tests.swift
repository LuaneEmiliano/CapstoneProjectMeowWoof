//
//  PetViewModel_Tests.swift
//  CapstoneProjectMeowWoof_Tests
//
//  Created by luane Niejelski on 10/23/22.
//

import XCTest
@testable import CapstoneProjectMeowWoof

class PetViewModel_Tests: XCTestCase {

    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_PetViewModel_pets_isEmpty() throws {
        // Given
        let viewModel = PetViewModel()
        
        // When
        viewModel.pets.removeAll()
        
        // Then
        XCTAssertTrue(viewModel.pets.isEmpty)
        XCTAssertFalse(!viewModel.pets.isEmpty)
    }
    
    func test_PetViewModel_addPet() throws {
        // Given
        let viewModel = PetViewModel()
        
        // When
        viewModel.pets.removeAll()
        viewModel.addPet(pet: Pet(name: "TestPet"))
        
        // Then
        XCTAssertFalse(viewModel.pets.isEmpty)
    }
    
    func test_PetViewModel_updatePet() throws {
        // Given
        let viewModel = PetViewModel()
        let pet = Pet(name: "TestPet")
        // When
        viewModel.pets.removeAll()
        viewModel.addPet(pet: pet)
        viewModel.updatePetInfo(
            id: pet.id,
            birthDay: Date(),
            weight: 100,
            gender: "Male",
            breed: "Retriever",
            favoriteToys: nil,
            favoriteFood: [],
            favoriteActivity: ["Running"],
            typeOfAnimal: nil,
            color: nil)
        
        // Then
        XCTAssertFalse(viewModel.pets.isEmpty)
        XCTAssertEqual(viewModel.pets[0].id, pet.id)
        XCTAssert(viewModel.pets[0].weight == 100)
        XCTAssert(viewModel.pets[0].favoriteFood.isEmpty)
        XCTAssert(viewModel.pets[0].favoriteActivity.count > 0)
    }

}
