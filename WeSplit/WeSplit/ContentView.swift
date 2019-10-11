//
//  ContentView.swift
//  WeSplit
//
//  Created by Collin Hemeltjen on 08/10/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var checkAmount = ""
	@State private var numberOfPeople = "4"
	@State private var tipPercentage = 2

	let tipPercentages = [10, 15, 20, 25, 0]

	var totalAmount: Double {
		let tipSelection = Double(tipPercentages[tipPercentage])
		let orderAmount = Double(checkAmount) ?? 0

		let tipValue = orderAmount / 100 * tipSelection
		return orderAmount + tipValue
	}

	var totalPerPerson: Double {
		let peopleCount = Double(numberOfPeople) ?? 0
		let amountPerPerson = totalAmount / peopleCount

		return amountPerPerson
	}

    var body: some View {
		NavigationView{
			Form {
				Section {
					HStack{
						Text("€")
						TextField("Amount", text: $checkAmount)
						.keyboardType(.decimalPad)
					}
					HStack{
						Text("Number of people:")
						TextField("0", text: $numberOfPeople)
							.keyboardType(.numberPad)
							.multilineTextAlignment(.trailing)
					}


				}
				Section(header: Text("How much tip do you want to leave?")){
					Picker("Tip percentage", selection: $tipPercentage){
						ForEach(0 ..< tipPercentages.count) {
							Text("\(self.tipPercentages[$0])%")
						}
					} .pickerStyle(SegmentedPickerStyle())
				}
				Section(header: Text("Total amount including tip")){
					Text("€\(totalAmount, specifier: "%.2f")")
				}
				Section(header: Text("Amount per person")) {
					Text("€\(totalPerPerson, specifier: "%.2f")")

				}
			}
		.navigationBarTitle("WeSplit")
		}
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
