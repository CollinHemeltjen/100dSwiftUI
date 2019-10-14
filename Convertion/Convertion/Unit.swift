//
//  Unit.swift
//  Convertion
//
//  Created by Collin Hemeltjen on 11/10/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

struct Unit {
	let symbol: String
	let toBaseRatio: Double
}

protocol Units {
	var groupName: String { get }
	var list: [Unit] { get }
}
