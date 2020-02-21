//
//  TableSelector.swift
//  tables
//
//  Created by Collin Hemeltjen on 28/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct TableSelector: View {
	@State var tables = [Bool](repeating: false, count: 13)

    var body: some View {
		VStack{
			HStack{
				ForEach(0...6, id: \.self){ number in
					Toggle(isOn: self.$tables[number]) {
							Text("\(number)")
						}.toggleStyle(MyToggleStyle())
				}
			}.padding(5)
			HStack{
				ForEach(7...12, id: \.self){ number in
					Toggle(isOn: self.$tables[number]) {
						Text("\(number)")
					}.toggleStyle(MyToggleStyle())
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


struct MyToggleStyle: ToggleStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label
			if configuration.isOn {
				Image(systemName: "checkmark")
			}
        }
		.frame(width: 50, height: 30, alignment: .center)
		.background(RoundedRectangle(cornerRadius: 5)
		.fill(Color.black.opacity(0.1)))
		.compositingGroup()
		.onTapGesture {
			  withAnimation {
				  configuration.$isOn.wrappedValue.toggle()
			  }
		}
    }
}
