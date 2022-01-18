//
//  CarCustomerUITests.swift
//  CarCustomerUITests
//
//  Created by Vanichjakvong, Jakpat (IRG) on 14/01/2022.
//

import XCTest

class CarCustomerUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWhenBoughtTiresAndExhaustPackageOtherTwoUpgradesAreDisabled() throws {
        // UI tests must launch the application that they test.
        
        //arrange
        let app = XCUIApplication()
        app.launch()

        //act
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.switches["Exhaust Package ($2,000)"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires Package ($1,500)"]/*[[".cells[\"Tires Package ($1,500)\"].switches[\"Tires Package ($1,500)\"]",".switches[\"Tires Package ($1,500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        //assert
        XCTAssertEqual(tablesQuery.switches["Exhaust Package ($2,000)"].isEnabled, true)
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires Package ($1,500)"]/*[[".cells[\"Tires Package ($1,500)\"].switches[\"Tires Package ($1,500)\"]",".switches[\"Tires Package ($1,500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, true)
        XCTAssertEqual(tablesQuery.switches["Engine Package ($2,500)"].isEnabled, false)
        XCTAssertEqual(tablesQuery.switches["Reflective Paint ($50)"].isEnabled, true)
                                
        
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSellingWhenBroke() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()

        

        //act
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires Package ($1,500)"]/*[[".cells[\"Tires Package ($1,500)\"].switches[\"Tires Package ($1,500)\"]",".switches[\"Tires Package ($1,500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.switches["Engine Package ($2,500)"].tap()
        
        
        
        //assert
        XCTAssertEqual(tablesQuery.switches["Exhaust Package ($2,000)"].isEnabled, false)
        XCTAssertEqual(tablesQuery/*@START_MENU_TOKEN@*/.switches["Tires Package ($1,500)"]/*[[".cells[\"Tires Package ($1,500)\"].switches[\"Tires Package ($1,500)\"]",".switches[\"Tires Package ($1,500)\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.isEnabled, true)
        XCTAssertEqual(tablesQuery.switches["Engine Package ($2,500)"].isEnabled, true)
        XCTAssertEqual(tablesQuery.switches["Reflective Paint ($50)"].isEnabled, true)
        
        
    }
    
    func testRemainingMoneyAfterBuying() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()
        
        
        //act
        let tablesQuery = XCUIApplication().tables
        tablesQuery.switches["Engine Package ($2,500)"].tap()
        tablesQuery.switches["Reflective Paint ($50)"].tap()
        
        
        XCTAssert(XCUIApplication().tables.staticTexts["Money: $2,450"].exists)
        
    }
    
    func testNextCarButton() throws {
        //arrange
        let app = XCUIApplication()
        app.launch()
        
        //act
        XCUIApplication().tables/*@START_MENU_TOKEN@*/.buttons["Next Car"]/*[[".cells[\"Make: Mazda, Model: MX-5, Top Speed: 125, Acceleration (0-60): 7.7mph, Handling: 5, Next Car\"].buttons[\"Next Car\"]",".buttons[\"Next Car\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //assert
        XCTAssert(XCUIApplication().tables.staticTexts["Make: 1"].exists)
        XCTAssert(XCUIApplication().tables.staticTexts["Model: test1"].exists)
        XCTAssert(XCUIApplication().tables.staticTexts["Top Speed: 1mph"].exists)
        XCTAssert(XCUIApplication().tables.staticTexts["Acceleration (0-60): 1.0"].exists)
        XCTAssert(XCUIApplication().tables.staticTexts["Handling: 1"].exists)
    }


    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
