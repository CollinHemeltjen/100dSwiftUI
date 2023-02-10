//
//  TableSelector.swift
//  tables
//
//  Created by Collin Hemeltjen on 28/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

import SwiftUI

struct TableSelector: View {
	@Binding var tables: [Bool]

	init(tables: Binding<[Bool]>) {
		_tables = tables
	}

    var body: some View {
		VStack{
			HStack{
				ForEach(0...6, id: \.self){ number in
					Toggle(isOn: self.$tables[number]) {
							Text("\(number)")
						}.toggleStyle(MyToggleStyle())
				}
			}
			HStack{
				ForEach(7...12, id: \.self){ number in
					Toggle(isOn: self.$tables[number]) {
						Text("\(number)")
					}.toggleStyle(MyToggleStyle())
				}
			}
		}
    }
}

struct TableSelector_Previews: PreviewProvider {
    static var previews: some View {
		let tablesfalse = [Bool](repeating: false, count: 13)
		let tablestrue = [Bool](repeating: true, count: 13)
		return Group{
			TableSelector(tables: .constant(tablestrue))
			TableSelector(tables: .constant(tablesfalse))
		}
	}
}


struct MyToggleStyle: ToggleStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
		ZStack{
			Image(systemName: "none")
				.opacity(0)
			HStack {
				configuration.label
				if configuration.isOn {
					Image(systemName: "checkmark")
				}
			}
			.frame(width: 45, height: 30, alignment: .center)
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
}
