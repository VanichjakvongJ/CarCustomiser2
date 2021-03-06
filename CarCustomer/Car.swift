//
//  Car.swift
//  CarCustomer
//
//  Created by Vanichjakvong, Jakpat (IRG) on 14/01/2022.
//

import Foundation

struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double {
        didSet {
            acceleration = round(acceleration * 100) / 100.0
        }
    }
    var handling: Int
    
    func displayStats() -> [String] {
        return ["Make: \(make)", "Model: \(model)", "Top Speed: \(topSpeed)mph", "Acceleration (0-60): \(acceleration)", "Handling: \(handling)"]
    }
}
