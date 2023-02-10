//
//  StartMenuView.swift
//  tables
//
//  Created by Collin Hemeltjen on 23/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct StartMenuView: View {
	@State private var tables = [Bool](repeating: false, count: 13)
	let amountOfQuestionOptions = ["5","10","20","Allemaal"]
	@State private var amountOfQuestionsOption = 1
	@ObservedObject var viewModel: QuestionViewModel

	init(viewModel: QuestionViewModel){
		self.viewModel = viewModel
	}

	var body: some View {
		VStack{
			HStack{
				Text("Welke tafels wil je oefenen?")
					.font(.largeTitle)
					.fontWeight(.black)
					.padding()
				Spacer()
			}
			TableSelector(tables: $tables)
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
	

	func startGame(){
		guard tables.contains(true) else {
			return
		}
		
		var amountOfQuestions = 0
		switch amountOfQuestionsOption {
		case 0:
			amountOfQuestions = 5
		case 1:
			amountOfQuestions = 10
		case 2:
			amountOfQuestions = 20
		default:
			viewModel.startGame(with: tables); return
		}

		viewModel.startGame(with: tables, for: amountOfQuestions)
	}
}

struct StartMenuView_Previews: PreviewProvider {
	static var previews: some View {
		StartMenuView(viewModel: QuestionViewModel())
	}
}
