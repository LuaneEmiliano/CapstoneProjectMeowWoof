//
//  UnitTestingViewModel_Tests.swift
//  CapstoneProjectMeowWoof_Tests
//
//  Created by luane Niejelski on 10/23/22.
//

import XCTest
@testable import CapstoneProjectMeowWoof

// Testing stricture: Given, when, then
class UnitTestingViewModel_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_UnitTestingViewModel_isPremium_shouldBeTrue() {
        let userIsPremium: Bool = true
        
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        XCTAssert(vm.isPremium)
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeFalse() {
        let userIsPremium: Bool = false
        
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        XCTAssertFalse(vm.isPremium)
           
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue() {
        let userIsPremium: Bool = Bool.random()
        
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        XCTAssertEqual(vm.isPremium, userIsPremium)
     
    }
    
    func test_UnitTestingViewModel_isPremium_shouldBeInjectedValue_stress() {
        for _ in 0..<10 {
        let userIsPremium: Bool = Bool.random()
        
        let vm = UnitTestingViewModel(isPremium: userIsPremium)
        
        XCTAssertEqual(vm.isPremium, userIsPremium)
        }
     
    }
    func test_UnitTestingViewModel_dataArray_shoulBeEmpty() {
        let vm = UnitTestingViewModel(isPremium: Bool.random())
        
        XCTAssertTrue(vm.dataArray.isEmpty)
        XCTAssertEqual(vm.dataArray.count, 0)
     
}
