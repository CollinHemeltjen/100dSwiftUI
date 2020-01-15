//
//  ContentView.swift
//  Animations
//
//  Created by Collin Hemeltjen on 04/11/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@State private var isShowingRed = false

    var body: some View {
		VStack {
            Button("Tap Me") {
				withAnimation {
					self.isShowingRed.toggle()
				}

            }

            if isShowingRed {
				Rectangle()
					.fill(Color.red)
					.frame(width: 200, height: 200)
					.transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))

			}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
