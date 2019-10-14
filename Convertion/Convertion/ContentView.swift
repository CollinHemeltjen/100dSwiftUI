//
//  ContentView.swift
//  Convertion
//
//  Created by Collin Hemeltjen on 11/10/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var amountToConvert = "0"

	@State private var inputUnit = 0
	@State private var outputUnit = 1

	var conversionUnits = LengthUnits().list

	private var convertedAmount: Double {
		let inputAmount = Double(amountToConvert) ?? 0
		let inputRatio = conversionUnits[inputUnit].toBaseRatio

		let baseAmount = inputAmount / inputRatio

		let outputRatio = conversionUnits[outputUnit].toBaseRatio
		let outputAmount = baseAmount * outputRatio

		return outputAmount
	}

    var body: some View {
		Form{
			Section(header: Text("Unit to convert")) {
				TextField("0", text: $amountToConvert)
					.keyboardType(.decimalPad)
				Picker("Unit to convert", selection: $inputUnit) {
					ForEach (0 ..< conversionUnits.count){
						Text("\(self.conversionUnits[$0].symbol)")
					}
				}.pickerStyle(SegmentedPickerStyle())
			}
			Section(header: Text("Unit to convert to")) {
				Picker("Unit to convert to", selection: $outputUnit) {
					ForEach (0 ..< conversionUnits.count){
						Text("\(self.conversionUnits[$0].symbol)")
					}
				}.pickerStyle(SegmentedPickerStyle())
				Text("\(convertedAmount, specifier: "%g")")
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
