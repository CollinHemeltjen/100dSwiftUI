//
//  TableSelector.swift
//  tables
//
//  Created by Collin Hemeltjen on 28/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct TableSelector: View {
    var body: some View {
		VStack{
			HStack{
				ForEach(0...6, id: \.self){
					Button("\($0)"){

					}.buttonStyle(PillButtonStyle())
				}
			}.padding(5)
			HStack{
				ForEach(7...12, id: \.self){
					Button("\($0)"){

					}.buttonStyle(PillButtonStyle())
				}
			}.padding(5)
		}
    }
}

struct TableSelector_Previews: PreviewProvider {
    static var previews: some View {
        TableSelector()
    }
}

struct PillButtonStyle: ButtonStyle {
	var selected = false

    public func makeBody(configuration: PillButtonStyle.Configuration) -> some View {

        configuration.label
			.multilineTextAlignment(.center)
			.frame(width: 40, height: 30, alignment: .center)
			.background(RoundedRectangle(cornerRadius: 5)
				.fill(Color.black.opacity(0.1)))
            .compositingGroup()
    }
}
