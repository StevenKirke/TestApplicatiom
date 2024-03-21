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

	let declinationNumberService: IDeclinationNumberService
	let dateConvertService: IDateConvertService

	init(
		declinationNumberService: IDeclinationNumberService,
		dateConvertService: IDateConvertService
	) {
		self.declinationNumberService = declinationNumberService
		self.dateConvertService = dateConvertService
	}

	func convertModelDTO(modelDTO: [VacancyDTO]) -> [MainSearchModel.Response.Vacancy] {
		converterModel(modelDTO: modelDTO)
	}
}

extension ConvertorVacanciesDTO: IConvertorVacanciesDTO {
	func converterModel(modelDTO: [VacancyDTO]) -> [MainSearchModel.Response.Vacancy] {
		modelDTO.map {
			MainSearchModel.Response.Vacancy(
				id: $0.id,
				lookingNumber: declinationHuman($0.lookingNumber),
				title: $0.title,
				address: addressMapping($0.address),
				company: $0.company,
				experience: $0.experience.previewText,
				publishedDate: assemblerPublishedDate( $0.publishedDate),
				isFavorite: $0.isFavorite,
				appliedNumber: $0.appliedNumber
			)
		}
	}

	private func addressMapping(_ address: AddressDTO) -> MainSearchModel.Response.Address {
		MainSearchModel.Response.Address(town: address.town, street: address.street, house: address.house)
	}

	private func assemblerPublishedDate(_ publishedDate: String) -> String {
		let convertData = dateConvertService.convertDataTOShort(dataString: publishedDate)
		return "Опубликовано \(convertData)"
	}

	private func declinationHuman(_ lookingNumber: Int?) -> String {
		var assemblerLookingNumber = ""
		if let number = lookingNumber {
			if declinationNumberService.declinationNumberHuman(countHuman: number).isDeclination {
				assemblerLookingNumber += "Сейчас просматривают \(number) человека"
			} else {
				assemblerLookingNumber += "Сейчас просматривает \(number) человек"
			}
		}
		return assemblerLookingNumber
	}
}
