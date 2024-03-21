//
//  DeclinationNumberService.swift
//  Test application
//
//  Created by Steven Kirke on 20.03.2024.
//

import Foundation

struct Declination {
	let number: String
	let isDeclination: Bool
}

protocol IDeclinationNumberService {
	func declinationNumberHuman(countHuman: Int?) -> Declination
}

final class DeclinationNumberService {
	func declinationHuman(human: Int?) -> Declination {
		declinationNumberHuman(countHuman: human)
	}
}
extension DeclinationNumberService: IDeclinationNumberService {
	func declinationNumberHuman(countHuman: Int?) -> Declination {
		var assembler: Declination = Declination(number: "", isDeclination: false)
		if let currentHuman = countHuman {
			let number = currentHuman % 100
			if number >= 11 && number <= 19 {
				assembler = Humans.human(currentHuman).declination
			} else {
				let present = number % 10
				switch present {
				case 1:
					assembler = Humans.human(currentHuman).declination
				case 2, 3, 4:
					assembler = Humans.humans(currentHuman).declination
				default:
					assembler = Humans.human(currentHuman).declination
				}
			}
		}
		return assembler
	}

	private enum Humans {
		case human(Int)
		case humans(Int)

		var declination: Declination {
			var declination = Declination(number: "", isDeclination: false)
			switch self {
			case .human(let count):
				declination = Declination(number: "\(count) человек", isDeclination: false)
			case .humans(let count):
				declination = Declination(number: "\(count) человека", isDeclination: true)
			}
			return declination
		}
	}
}
