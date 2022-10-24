//
//  TabView_UITests.swift
//  CapstoneProjectMeowWoof_UITests
//
//  Created by luane Niejelski on 10/23/22.
//

import XCTest

class TabView_UITests: XCTestCase {

    let app = XCUIApplication()
    
    

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {}

    func test_AnimalListView_initialTest() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // Given
        sleep(5)
        
        // When
        app.tabBars["Tab Bar"].buttons["Home"].tap()
        app.tabBars["Tab Bar"].buttons["Reminder"].tap()
        app.tabBars["Tab Bar"].buttons["More"].tap()
        app.tabBars["Tab Bar"].buttons["Chat"].tap()

                
    }

}
