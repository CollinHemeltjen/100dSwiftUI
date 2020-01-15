//
//  ConfirmButton.swift
//  tables
//
//  Created by Collin Hemeltjen on 25/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct ConfirmButtonStyle: ButtonStyle {
    public func makeBody(configuration: ConfirmButtonStyle.Configuration) -> some View {

        configuration.label
            .foregroundColor(.white)
			.padding()
			.padding(.horizontal)
			.background(RoundedRectangle(cornerRadius: 15).fill(Color.black.opacity(0.25)))
			.font(Font.title.weight(.black))
            .compositingGroup()
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

struct ConfirmButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button("Volgende vraag"){

		}.buttonStyle(ConfirmButtonStyle())

	}
}
