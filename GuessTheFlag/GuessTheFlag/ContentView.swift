//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Collin Hemeltjen on 13/10/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
	@State private var correctAnswer = Int.random(in: 0...2)

	@State private var showingScore = false
	@State private var scoreTitle = ""

	@State private var score = 0
	@State private var animationAmount = [0.0, 0.0, 0.0]
	@State private var isCorrect = [true, true, true]

    var body: some View {
		ZStack{
			LinearGradient(gradient: Gradient(colors: [.blue, .black]),
						   startPoint: .top,
						   endPoint: .bottom)
				.edgesIgnoringSafeArea(.all)

			VStack(spacing: 30){
				VStack{
					Text("Tap the flag of")
					Text(countries[correctAnswer])
						.font(.largeTitle)
						.fontWeight(.black)
					
					
				}.foregroundColor(.white)

				ForEach(0 ..< 3) { number in
					Button(action: {
						self.flagTapped(number)
					}) {
						FlagImage(image: self.countries[number])
					}
					.rotation3DEffect(.degrees(self.animationAmount[number]),
									   axis: (x: 0, y: 1, z: 0))
						.opacity(self.isCorrect[number] ? 1 : 0)
				}
				VStack{
					Text(scoreTitle)
					Text("Score:")
					Text("\(self.score)")
						.font(.title)
						.fontWeight(.black)
				}.foregroundColor(.white)
				Spacer()
			}
		}
    }

	func flagTapped(_ number: Int) {
		if number == correctAnswer {
			scoreTitle = "Correct"
			score += 1
			withAnimation {
				self.animationAmount[number] += 360

				for i in 0..<isCorrect.count where i != number{
					isCorrect[i] = false
				}
			}
		} else {
			scoreTitle = "Wrong, that is the flag of \(countries[number])"
			score -= 1
		}

		askQuestion()
	}

	func askQuestion(){
		countries.shuffle()
		correctAnswer = Int.random(in: 0...2 )
		self.animationAmount = [0.0, 0.0, 0.0]
		withAnimation{
			self.isCorrect = [true, true, true]
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FlagImage: View {
	var image: String

	init(image: String) {
		self.image = image
	}

	var body: some View {
		Image(image)
			.renderingMode(.original)
			.clipShape(Capsule())
			.overlay(Capsule()
				.stroke(Color.black,
						lineWidth: 1))
			.shadow(color:.black, radius: 2)
	}
}
