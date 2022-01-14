//
//  CarCustomerTests.swift
//  CarCustomerTests
//
//  Created by Vanichjakvong, Jakpat (IRG) on 14/01/2022.
//

import XCTest
//@testable import CarCustomer

class CarCustomerTests: XCTestCase {
    
    func testNewCarGivesMeACarWithAllAttributesSet() {
        //arrange
        //act
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)
    }
    
    func testDisplayStats() {

        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
        let expectedStats = ["Make: Mazda", "Model: MX-5", "Top Speed: 125", "Acceleration (0-60): 7.7", "Handling: 5"]
        
        for i in 0..<car.displayStats().count {
            XCTAssertEqual(car.displayStats()[i], expectedStats[i])
        }
        
    }


}
