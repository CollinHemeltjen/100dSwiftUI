//
//  LengthUnits.swift
//  Convertion
//
//  Created by Collin Hemeltjen on 11/10/2019.
//  Copyright © 2019 Collin Hemeltjen. All rights reserved.
//

struct LengthUnits: Units {
	let groupName = "Length"
	
	// Base is in milimeter
	let list = [
		Unit(symbol: "m", toBaseRatio: 0.001),
		Unit(symbol: "km", toBaseRatio: 0.000001),
		Unit(symbol: "ft", toBaseRatio: 0.00328084),
		Unit(symbol: "yd", toBaseRatio: 0.001093613),
		Unit(symbol: "mi", toBaseRatio: 0.000000621)
	]
}

struct TempatureUnits: Units {
	let groupName = "Tempature"

	// Base is celcius
	let list = [
		Unit(symbol: "Celcius", toBaseRatio: 0),
		Unit(symbol: "Fahrenheit", toBaseRatio: 33.8),
		Unit(symbol: "Kelvin", toBaseRatio: 274.15)
	]

}

struct TimeUnits: Units {
	let groupName = "Time"

	// Base is seconds
	let list = [
		Unit(symbol: "seconds", toBaseRatio: 0),
		Unit(symbol: "minutes", toBaseRatio: 0.01666667),
		Unit(symbol: "hours", toBaseRatio: 0.0002777778),
		Unit(symbol: "days", toBaseRatio: 0.00001157407)
	]
}

struct VolumeUnits: Units {
	let groupName = "Volume"

	// Base is milliliters
	let list = [
		Unit(symbol: "milliliters", toBaseRatio: 0),
		Unit(symbol: "liters", toBaseRatio: 0.001),
		Unit(symbol: "cups", toBaseRatio: 0.003519503),
		Unit(symbol: "pints", toBaseRatio: 0.002113376),
		Unit(symbol: "gallons", toBaseRatio: 0.0002199692)
	]
}

