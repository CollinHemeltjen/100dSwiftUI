//
//  QuestionViewModel.swift
//  tables
//
//  Created by Collin Hemeltjen on 23/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import Foundation
import Combine

class QuestionViewModel: ObservableObject {
	@Published var questions: [Question]?
	@Published var finishedQuestions = [Question]()

	@Published var currentQuestion: Question?

	func startGame(with tableOf: [Int], for amountOfQuestions: Int? = 24){
		var tableOf = tableOf
		var questions = [Question]()
		finishedQuestions = [Question]()

		tableOf.removeAll(where: {$0 == -1})
		for i in 0...12 {
			for table in tableOf {
				let question = Question(table, times: i)
				questions.append(question)
			}
		}

		for i in 0...12 {
			for table in tableOf {
				let question = Question(i, times: table)
				questions.append(question)
			}
		}

		questions.shuffle()

		self.questions = questions.dropLast(questions.count - amountOfQuestions!)
		currentQuestion = questions[0]
	}

	func nextQuestion(){
		guard questions != nil, questions!.count > 0 else {
			return
		}
		questions!.removeFirst()
		if currentQuestion != nil {
			finishedQuestions.append(currentQuestion!)
		}

		guard questions != nil, questions!.count > 0 else {
			return
		}
		currentQuestion = questions![0]
	}

	func amountOfCorrectQuestions() -> Int {
		var correctCount = 0
		for question in finishedQuestions {
			if question.answer == question.correctAnswer {
				correctCount += 1
			}
		}

		return correctCount
	}
}
