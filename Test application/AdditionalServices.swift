//
//  AdditionalServices.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import Foundation

struct AdditionalService: Hashable {
	let title: String
	let image: String
	let button: String
}

final class AdditionalServices {
	func getAdditionalServices() -> [AdditionalService] {
		[
			AdditionalService(
				title: "Вакансии рядом с вами",
				image: "Images/Icons/iconLocation",
				button: ""
			),
			AdditionalService(
				title: "Поднять резюме в поиске",
				image: "Images/Icons/iconUpSearch",
				button: "Поднять"
			),
			AdditionalService(
				title: "Временная работа и подработка",
				image: "Images/Icons/iconTimeWork",
				button: ""
			)
		]
	}
}
