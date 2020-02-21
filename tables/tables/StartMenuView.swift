//
//  StartMenuView.swift
//  tables
//
//  Created by Collin Hemeltjen on 23/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct StartMenuView: View {
	@State private var amountOfTables = 1
	@State private var table = [Int.random(in: 0...12), -1, -1, -1, -1]
	let amountOfQuestionOptions = ["5","10","20","Allemaal"]
	@State private var amountOfQuestionsOption = 1
	@ObservedObject var viewModel: QuestionViewModel

	init(viewModel: QuestionViewModel){
		self.viewModel = viewModel
	}

	var body: some View {
		ScrollView{
			VStack{
				HStack{
					Text("Aantal tafels")
						.font(.largeTitle)
						.fontWeight(.black)
						.padding()
					Spacer()
				}
				HStack{
					Button(action: {
						if(self.amountOfTables > 1){
							self.amountOfTables -= 1
							self.table[self.amountOfTables] = -1
						}
					}){
						Text("-")
							.font(.largeTitle)
							.fontWeight(.black)
							.padding()
					}
					Text("\(amountOfTables)")
						.font(.largeTitle)
						.fontWeight(.black)
						.padding()
					Button(action: {
						if(self.amountOfTables < 5){
							self.amountOfTables += 1
							self.table[self.amountOfTables-1] = Int.random(in: 0...12)
						}
					}){
						Text("+")
							.font(.largeTitle)
							.fontWeight(.black)
							.padding()
					}
				}
				HStack{
					Text("Welke tafel wil je oefenen?")
						.font(.largeTitle)
						.fontWeight(.black)
						.padding()
					Spacer()
				}
				VStack{
					ForEach(0...(self.amountOfTables - 1), id: \.self){
						Picker(selection: self.$table[$0], label: Text("Picker")) {
							ForEach(0...12, id: \.self){
								Text("\($0)")
							}
						}.pickerStyle(SegmentedPickerStyle())
					}
				}
				HStack{
					Text("Hoeveel sommetjes wil je?")
						.font(.largeTitle)
						.fontWeight(.black)
						.padding()
					Spacer()
				}
				Picker(selection: $amountOfQuestionsOption, label: Text("Picker")) {
					ForEach(0..<amountOfQuestionOptions.count, id: \.self){
						Text(self.amountOfQuestionOptions[$0])
					}
				}.pickerStyle(SegmentedPickerStyle())
				Spacer()
				Button("Begin"){
					withAnimation(){
						self.startGame()
					}
				}.buttonStyle(ConfirmButtonStyle())

				Spacer()
			}.padding()
		}
	}

	func startGame(){
		var amountOfQuestions = 0
		switch amountOfQuestionsOption {
		case 0:
			amountOfQuestions = 5
		case 1:
			amountOfQuestions = 10
		case 2:
			amountOfQuestions = 20
		default:
			viewModel.startGame(with: table); return
		}

		viewModel.startGame(with: table, for: amountOfQuestions)
	}
}

struct StartMenuView_Previews: PreviewProvider {
	static var previews: some View {
		StartMenuView(viewModel: QuestionViewModel())
	}
}
