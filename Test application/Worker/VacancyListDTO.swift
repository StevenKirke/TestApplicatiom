//
//  VacancyListDTO.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import Foundation

struct VacancyListDTO: Codable {
	let offers: [OfferDTO]
	let vacancies: [VacancyDTO]
}

struct OfferDTO: Codable {
	let id: String?
	let title: String
	let link: String
	let button: ButtonDTO?
}

struct ButtonDTO: Codable {
	let text: String
}

struct VacancyDTO: Codable {
	let id: String
	let lookingNumber: Int?
	let title: String
	let address: AddressDTO
	let company: String
	let experience: ExperienceDTO
	let publishedDate: String
	let isFavorite: Bool
	let salary: SalaryDTO
	let schedules: [String]
	let appliedNumber: Int?
	let description: String?
	let responsibilities: String
	let questions: [String]
}

struct AddressDTO: Codable {
	let town: String
	let	street: String
	let	house: String
}

struct ExperienceDTO: Codable {
	let previewText, text: String
}

struct SalaryDTO: Codable {
	let full: String
	let short: String?
}
