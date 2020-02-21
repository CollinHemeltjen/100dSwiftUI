//
//  ContentView.swift
//  tables
//
//  Created by Collin Hemeltjen on 16/11/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
	@ObservedObject var viewModel = QuestionViewModel()

	var body: some View {
		ZStack{
			Color.pink.edgesIgnoringSafeArea(.all)
			VStack {
				if viewModel.questions == nil {
					StartMenuView(viewModel: viewModel)
				} else {
					if viewModel.questions!.count > 0 {
						QuestionContainer(viewModel: viewModel)
//							.transition(.slide)
					} else {
						ReView(viewModel: viewModel)
					}
				}
			}
		}.foregroundColor(Color.white)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}



