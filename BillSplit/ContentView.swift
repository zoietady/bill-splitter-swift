//
//  ContentView.swift
//  BillSplit
//
//  Created by Zoie Tad-y on 6/26/20.
//  Copyright © 2020 Zoie Tad-y. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var bill = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 4
    
    let tipPercentages = [0,5,10,15,20,25,30]
    
    var totalPerPerson: Double {
        let amount = Double(bill) ?? 0
        let splitBy = Double(numberOfPeople + 2)
        let tipSelected = Double(tipPercentages[tipPercentage])
        
        let tipValue = amount / 100 * tipSelected
        let grandTotal = amount + tipValue
        let amountPerPerson = grandTotal / splitBy
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section(header:Text("How much is the total bill?")){
                    TextField("Amount",text: $bill)
                }
                
                Section(header:Text("Split between how many?")){
                    Picker("Number of People", selection: $numberOfPeople){
                        ForEach (2 ..< 100){
                            Text("\($0) People")
                        }
                    }
                }
                
                Section(header:Text("How much tip?")){
                    Picker("Number of People", selection: $tipPercentage){
                        ForEach (2 ..< tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header:Text("Amount per Person")){
                    Text("$ \(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("Bill Split")
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
