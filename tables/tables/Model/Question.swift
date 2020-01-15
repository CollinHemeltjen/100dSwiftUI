//
//  Question.swift
//  tables
//
//  Created by Collin Hemeltjen on 23/12/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//
import Combine

struct Question {
	let lhs: Int
	let rhs: Int
	var correctAnswer: Int {
		lhs * rhs
	}
	var answer: Int?

	init(_ lhs: Int, times rhs: Int) {
		self.lhs = lhs
		self.rhs = rhs
	}
}
