//
//  QuestionView.swift
//  tables
//
//  Created by Collin Hemeltjen on 23/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct QuestionView: View {
	@State var answer = 0
	var currentQuestion: Question
	var completion: ((Int) -> Void)?

	let colors = [Color.pink, Color.orange, Color.blue, Color.yellow, Color.purple]
	init(question: Question, completion: ((Int) -> Void)? = nil){
		self.currentQuestion = question
		self.completion = completion
	}

    var body: some View {
		ZStack{
			colors.randomElement()?
				.edgesIgnoringSafeArea(.all)
				.animation(.easeInOut)
			VStack {
				Spacer()
				Text("\(currentQuestion.lhs) x \(currentQuestion.rhs) =")
					.font(.largeTitle)
					.fontWeight(.black)
					.padding()
					.transition(.move(edge: .bottom))
				Text("\(answer)")
					.font(.largeTitle)
					.fontWeight(.black)
					.padding()
				Spacer()
				Divider()
				NumPad(number: $answer, completion: completion)

			}
		}.foregroundColor(.white)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
		let question = Question(5, times: 7)
		return QuestionView(question: question)
    }
}
