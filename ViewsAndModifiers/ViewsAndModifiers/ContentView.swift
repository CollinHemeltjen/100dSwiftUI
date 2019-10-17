//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Collin Hemeltjen on 16/10/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct ProminentTitle: ViewModifier {
    func body(content: Content) -> some View {
		content
			.font(.largeTitle)
			.foregroundColor(.blue)
	}
}

extension View {
	func prominentTitleStyle() -> some View {
		self.modifier(ProminentTitle())
	}
}
struct ContentView: View {
    var body: some View {
        Text("Hello World")
		.prominentTitleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
