//
//  ContentView.swift
//  CarCustomer
//
//  Created by Vanichjakvong, Jakpat (IRG) on 14/01/2022.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    var body: some View {
        ForEach(car.displayStats(), id: \.self) {stat in
            Text(stat)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
