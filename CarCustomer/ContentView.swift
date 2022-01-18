//
//  ContentView.swift
//  CarCustomer
//
//  Created by Vanichjakvong, Jakpat (IRG) on 14/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var enginePackage = false
    @State private var reflectivePaint = false
    @State private var money = 5000
    @State private var remainingTime = 10
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    money -= 2000
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    money += 2000
                }
            }
        )
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 5
                    money -= 1500
                } else {
                    starterCars.cars[selectedCar].handling -= 5
                    money += 1500
                }
            }
        )
        let enginePackageBinding = Binding<Bool> (
            get: { self.enginePackage },
            set: { newValue in
                self.enginePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration += 5.0
                    money -= 2500
                } else {
                    starterCars.cars[selectedCar].acceleration -= 5.0
                    money += 2500
                }
            }
        )
        
        let reflectivePaintBinding = Binding<Bool> (
            get: { self.reflectivePaint },
            set: { newValue in
                self.reflectivePaint = newValue
                if newValue == true {
                    money -= 50
                } else {
                    money += 50
                }
            }
        )
        
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        VStack {
            Section {
                Text("\(remainingTime)")
                    .onReceive(timer) { _ in
                        if self.remainingTime > 0 {
                            self.remainingTime -= 1
                        }
                    }
            }
            
            Form {
                Section {
                    Text("Money: $\(money)")
                }
                
                
                
                VStack(alignment: .leading){
                    ForEach(starterCars.cars[selectedCar].displayStats(), id: \.self) {stat in
                        Text(stat)
                    }

                    Spacer()
                    
                    Button("Next Car", action: {
                        if selectedCar < starterCars.cars.count - 1 {
                            selectedCar += 1
                        } else {
                            selectedCar = 0
                        }
                        exhaustPackage = false
                        tiresPackage = false
                        enginePackage = false
                        reflectivePaint = false
                        money = 5000
                        starterCars = StarterCars()
                        
                    })
                    .disabled(remainingTime == 0)
                }
                Section {
                    Toggle("Exhaust Package ($\(2000))", isOn: exhaustPackageBinding)
                        .disabled(exhaustPackage == false && money < 2000 && remainingTime > 0)
                    Toggle("Tires Package ($\(1500))", isOn: tiresPackageBinding)
                        .disabled(tiresPackage == false && money < 1500 && remainingTime > 0)
                    Toggle("Engine Package ($\(2500))", isOn: enginePackageBinding)
                        .disabled(enginePackage == false && money < 2500 && remainingTime > 0)
                    Toggle("Reflective Paint ($\(50))", isOn: reflectivePaintBinding)
                        .disabled(reflectivePaint == false && money < 50 && remainingTime > 0)
                }
            }
        }
        

        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
