//
//  ConvertVacancyDTO.swift
//  Test application
//
//  Created by Steven Kirke on 20.03.2024.
//

import Foundation

protocol IConvertVacancyDTO: AnyObject {
	func converterModel(modelDTO: VacancyDTO) -> JobPageModel.Response.Vacancy
}

final class ConvertVacancyDTO: IConvertVacancyDTO {

	func converterModelDTO(modelDTO: VacancyDTO) -> JobPageModel.Response.Vacancy {
		converterModel(modelDTO: modelDTO)
	}
}

extension ConvertVacancyDTO {
	func converterModel(modelDTO: VacancyDTO) -> JobPageModel.Response.Vacancy {
		let address = JobPageModel.Response.Address(
			town: modelDTO.address.town,
			street: modelDTO.address.street,
			house: modelDTO.address.house
		)
		let convert = JobPageModel.Response.Vacancy(
			id: modelDTO.id,
			lookingNumber: modelDTO.lookingNumber,
			title: modelDTO.title,
			address: address,
			company: modelDTO.company,
			description: modelDTO.description ?? "",
			salary: modelDTO.salary.full,
			experience: modelDTO.experience.text,
			publishedDate: modelDTO.publishedDate,
			isFavorite: modelDTO.isFavorite,
			appliedNumber: modelDTO.appliedNumber,
			schedules: modelDTO.schedules,
			questions: modelDTO.questions,
			responsibilities: modelDTO.responsibilities
		)
		return convert
	}
}
