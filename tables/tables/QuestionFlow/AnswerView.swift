//
//  AnswerView.swift
//  tables
//
//  Created by Collin Hemeltjen on 24/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct AnswerView: View {
	let correct: Bool
	let question: Question
	var completion: (() -> Void)?

	init(correct: Bool, question: Question, completion: (() -> Void)? = nil) {
		self.correct = correct
		self.question = question
		self.completion = completion
	}

    var body: some View {
		ZStack{
			Color(correct ? UIColor.green : UIColor.red)
				.edgesIgnoringSafeArea(.all)
			VStack{
				Spacer()
				if correct {
					Text("Goedzo👍")
						.font(.largeTitle)
						.fontWeight(.black)
						.padding()
				} else {
					Text("Fout")
						.font(.largeTitle)
						.fontWeight(.black)
						.padding()
				}
				Text("\(question.lhs) x \(question.rhs) = \(question.correctAnswer)")
					.font(.title)
					.fontWeight(.bold)
					.padding()
				Spacer()
				Button("Volgende vraag"){
					self.completion?()
				}.buttonStyle(ConfirmButtonStyle())
				Spacer()
			}
		}.foregroundColor(.white)
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
		Group{
			AnswerView(correct: true, question: Question(5, times: 5))
			AnswerView(correct: false, question: Question(5, times: 5))
		}
    }
}
