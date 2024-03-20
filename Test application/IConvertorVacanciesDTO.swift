//
//  IConvertorVacanciesDTO.swift
//  Test application
//
//  Created by Steven Kirke on 20.03.2024.
//

import Foundation

protocol IConvertorVacanciesDTO: AnyObject {
	func converterModel(modelDTO: [VacancyDTO]) -> [MainSearchModel.Response.Vacancy]
}

final class ConvertorVacanciesDTO {

	let dataConvertor = TimeConvertServices()

	func convertModelDTO(modelDTO: [VacancyDTO]) -> [MainSearchModel.Response.Vacancy] {
		converterModel(modelDTO: modelDTO)
	}
}

extension ConvertorVacanciesDTO: IConvertorVacanciesDTO {
	func converterModel(modelDTO: [VacancyDTO]) -> [MainSearchModel.Response.Vacancy]
			{
		modelDTO.map {
			MainSearchModel.Response.Vacancy(
				id: $0.id,
				lookingNumber: self.declinationHuman($0.lookingNumber),
				title: $0.title,
				address: MainSearchModel.Response.Address(
					town: $0.address.town,
					street: $0.address.house,
					house: $0.address.street),
				company: $0.company,
				experience: $0.experience.previewText,
				publishedDate: dataConvertor.convertData(dataString: $0.publishedDate),
				isFavorite: $0.isFavorite,
				appliedNumber: $0.appliedNumber
			)
		}
	}
}

private extension ConvertorVacanciesDTO {
	enum Humans {
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
