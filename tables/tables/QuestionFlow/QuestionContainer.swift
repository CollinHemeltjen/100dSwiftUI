//
//  QuestionContainer.swift
//  tables
//
//  Created by Collin Hemeltjen on 24/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct QuestionContainer: View {
	@ObservedObject var viewModel: QuestionViewModel

	@State var answer: Int?

	init(viewModel: QuestionViewModel){
		self.viewModel = viewModel
		assert(viewModel.questions != nil)
		assert(viewModel.currentQuestion != nil)
	}

    var body: some View {
		VStack{
			if answer == nil {
				QuestionView(question: viewModel.currentQuestion!, completion: checkAnswer(_:))
			} else {
				AnswerView(correct: viewModel.currentQuestion!.correctAnswer == answer,
						   question: viewModel.currentQuestion!,
						   completion: nextQuestion)
			}
		}
    }

	func checkAnswer(_ answer: Int){
		self.answer = answer
		self.viewModel.currentQuestion?.answer = answer
	}

	func nextQuestion(){
		viewModel.nextQuestion()
		self.answer = nil
	}
}

struct QuestionContainer_Previews: PreviewProvider {
    static var previews: some View {
		let viewModel = QuestionViewModel()
		viewModel.startGame(with: 5)
        return QuestionContainer(viewModel: viewModel)
    }
}
