//
//  DeclinationHuman.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import Foundation

final class DeclinationHuman {

	private enum Humans {
		case human(Int)
		case humans(Int)

		var title: String {
			var title = "Сейчас"
			switch self {
			case .human(let count):
				title += " просматривает \(count) человек"
			case .humans(let count):
				title += " просматривают \(count) человека"
			}
			return title
		}
	}

	func declinationHuman(_ countHuman: Int?) -> String {
		var assembler = ""
		if let currentHuman = countHuman {
			let number = currentHuman % 100
			if number >= 11 && number <= 19 {
				assembler = Humans.human(currentHuman).title
			} else {
				let present = number % 10
				switch present {
				case 1:
					assembler = Humans.human(currentHuman).title
				case 2, 3:
					assembler = Humans.humans(currentHuman).title
				case 4:
					assembler = Humans.human(currentHuman).title
				default:
					assembler = Humans.human(currentHuman).title
				}
			}
		}
		return assembler
	}

}
