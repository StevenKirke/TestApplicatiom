//
//  CounterVacanciesService.swift
//  Test application
//
//  Created by Steven Kirke on 20.03.2024.
//

import Foundation

protocol IConvertCounterVacanciesService: AnyObject {
	func convertCounterVacancies(countVacancies: Int) -> String
}

final class ConvertCounterVacanciesService: IConvertCounterVacanciesService {
	func convertCounterVacancies(countVacancies: Int) -> String {
		conjugationVacancy(countVacancies)
	}
}

private extension ConvertCounterVacanciesService {
	func conjugationVacancy(_ countVacancies: Int) -> String {
		var title: String = ""
		let count = countVacancies
		let countString = String(count)
		let last = countString[countString.index(before: countString.endIndex)]
		let convertString = String(last)
		switch (convertString, count) {
		case (_, 11):
			title += "\(count) вакансии"
		case ("1", _):
			title += "\(count) вакансия"
		default:
			title += "\(count) вакансии"
		}
		return title
	}
}
