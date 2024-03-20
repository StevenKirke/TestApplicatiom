//
//  TimeConvertService.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import Foundation
/// Конвертирование даты".
final class TimeConvertServices {

	private let dateFormatter = DateFormatter()
	/**
	 Конвертация строкового значения даты в формат "20 января".
	 - Parameters:
			- dataToString: Текстовый формат даты.
	 - Returns: Вывод даты в значении "20 января"
	 */
	func convertData(dataString: String) -> String {
		self.convert(dataString)
	}

	// MARK: - Private methods
	private func convert(_ textData: String) -> String {
		var month = ""
		var day = ""

		dateFormatter.dateFormat = "yyyy-MM-dd"
		dateFormatter.locale = Locale(identifier: "ru_RU")
		let convertedDate = dateFormatter.date(from: textData)

		if let currentDate = convertedDate {
			// Месяц, длинное название.
			dateFormatter.dateFormat = "LLLL"
			month = dateFormatter.string(from: currentDate)
			// День.
			dateFormatter.dateFormat = "dd"
			day = dateFormatter.string(from: currentDate)
		}

		let assemblerDate = "Опубликовано \(cropNumber(day)) \(conjugation(month))"
		return assemblerDate
	}

	// Удаление нуля в дне недели, 02 -> 2.
	private func cropNumber(_ day: String) -> String {
		var currentDay = day
		let firstNumber = day.dropLast()
		if firstNumber == "0" {
			currentDay = String(day.dropFirst())
		}
		return currentDay
	}
	// Склонение месяца.
	private func conjugation(_ month: String) -> String {
		var convert = ""
		for element in Month.allCases where element.rawValue == month {
			convert = element.declination
		}
		return convert
	}
}

private enum Month: String, CaseIterable {
	case january = "январь"
	case february = "февраль"
	case march = "март"
	case april = "апрель"
	case may = "май"
	case june = "июль"
	case july = "июнь"
	case august = "август"
	case september = "сентябрь"
	case october = "октябрь"
	case november = "ноябрь"
	case december = "декабрь"

	var declination: String {
		var title = ""
		switch self {
		case .january:
			title = "января"
		case .february:
			title = "февраля"
		case .march:
			title = "марта"
		case .april:
			title = "апреля"
		case .may:
			title = "мая"
		case .june:
			title = "июля"
		case .july:
			title = "июня"
		case .august:
			title = "августа"
		case .september:
			title = "сентября"
		case .october:
			title = "октября"
		case .november:
			title = "ноября"
		case .december:
			title = "декабря"
		}
		return title
	}
}
