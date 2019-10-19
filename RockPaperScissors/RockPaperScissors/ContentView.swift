//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Collin Hemeltjen on 19/10/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	let possibleMoves = ["Rock", "Paper", "Scissors"]

	@State private var shouldWin = Bool.random()
	@State private var currentCoice = Int.random(in: 0..<3)

	@State private var score = 0
	@State private var round = 1

    var body: some View {
		VStack {
			Group {
				Text("Score: \(self.score)")
				Text("Round: \(self.round)")
			}
			Group {
				Text("The computers choice is")
				Text(possibleMoves[currentCoice])
					.font(.largeTitle)
			}
			Group {
				Text("You should")
				if shouldWin {
					Text("Win")
						.font(.largeTitle)
				} else {
					Text("Lose")
						.font(.largeTitle)
				}
			}
			Group {
				Text("Your choice:")
				HStack {
					ForEach(0..<possibleMoves.count) { i in
						Button(action: {
							self.evalMove(choice: i)
						}) {
							Text(self.possibleMoves[i])
						}
					}
				}
			}
		}
    }

	func evalMove(choice: Int){
		var choiceToWin = currentCoice + 1
		if choiceToWin == possibleMoves.count {
			choiceToWin = 0
		}

		var hasWon = false
		if choice == choiceToWin {
			hasWon = true
		}

		if hasWon == shouldWin {
			score += 1
		} else {
			score -= 1
		}

		nextRound()
	}

	func nextRound(){
		shouldWin = Bool.random()
		currentCoice = Int.random(in: 0..<3)

		guard round < 10 else {
			restart()
			return
		}

		round += 1
	}

	func restart(){
		round = 0
		score = 0
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
