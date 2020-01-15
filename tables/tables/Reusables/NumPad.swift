//
//  NumPad.swift
//  tables
//
//  Created by Collin Hemeltjen on 25/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct NumPad: View {
	@Binding var total: Int
	var completion: ((Int) -> Void)?

	init(number: Binding<Int>, completion: ((Int) -> Void)? = nil) {
		_total = number
		self.completion = completion
	}

    var body: some View {
		VStack{
			VStack{
				ForEach((1...3).reversed(), id: \.self) { vIndex in
					Group{
						HStack{
							ForEach((0...2), id: \.self) { hIndex in
								Group {
									Button("\(vIndex * 3 - hIndex)"){
										self.addNumber(vIndex * 3 - hIndex)
									}.buttonStyle(NumButtonStyle())
								}
							}
						}
					}
				}
				HStack{
					Button(action: {
						self.backSpace()
					}){
						Image(systemName: "delete.left.fill")
					}.buttonStyle(NumButtonStyle())
					Button("0"){
						self.addNumber(0)
					}.buttonStyle(NumButtonStyle())
					Button(action: {
						self.completion?(self.total)
					}){
						Image(systemName: "checkmark")
					}.buttonStyle(NumButtonStyle())
				}
			}
		}
    }

	func addNumber(_ numberToAdd: Int){
		if total == 0 {
			total = numberToAdd
		} else {
			total = Int("\(total)\(numberToAdd)") ?? total
		}
	}

	func backSpace(){
		var stringTotal = "\(total)"
		stringTotal.removeLast()
		total = Int(stringTotal) ?? 0
	}
}

struct NumPad_Previews: PreviewProvider {
	static var previews: some View {
		NumPad(number: .constant(0))
    }
}

struct NumButtonStyle: ButtonStyle {
    public func makeBody(configuration: NumButtonStyle.Configuration) -> some View {

        configuration.label
			.multilineTextAlignment(.center)
			.font(Font.title.weight(.black))
			.padding()
			.padding()
			.padding()
            .compositingGroup()
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
