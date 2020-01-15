//
//  ReView.swift
//  tables
//
//  Created by Collin Hemeltjen on 28/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct ReView: View {
	@ObservedObject var viewModel: QuestionViewModel

	init(viewModel: QuestionViewModel){
		self.viewModel = viewModel
	}

	var body: some View {
		VStack{
			Text("Je had \(viewModel.amountOfCorrectQuestions()) van de \(viewModel.finishedQuestions.count ?? 0) sommen goed.")
				.font(.largeTitle)
				.fontWeight(.black)
				.padding()
			Button("Speel opnieuw"){
				self.viewModel.questions = nil
			}.buttonStyle(ConfirmButtonStyle())

		}
	}
}


struct ReView_Previews: PreviewProvider {
    static var previews: some View {
		let viewModel = QuestionViewModel()
		var question = Question(5, times: 5)
		question.answer = 25
		viewModel.finishedQuestions = [question]
        return ReView(viewModel: viewModel)
    }
}
