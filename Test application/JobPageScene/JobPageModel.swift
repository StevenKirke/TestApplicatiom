//
//  JobPageModel.swift
//  Test application
//
//  Created by Steven Kirke on 20.03.2024.
//

import Foundation

// swiftlint:disable nesting
enum JobPageModel {
	enum Request { }

	enum Response {
		case showJobPage(Vacancy)
		case failure(Error)

		struct Vacancy {
			let id: String
			let lookingNumber: Int?
			let title: String
			let address: Address
			let company: String
			let description: String?
			let salary: String
			let experience: String
			let publishedDate: String
			var isFavorite: Bool
			let appliedNumber: Int?
			let schedules: [String]
			let questions: [String]
			let responsibilities: String
		}

		struct Address: Codable {
			let town, street, house: String
		}
	}

	enum ViewModel {
		case showJobPage(Vacancy)
		case failure(String)

		struct Vacancy {
			var id: String
			var lookingNumber: String
			var title: String
			var address: String
			var company: String
			var description: String
			var salary: String
			var experience: String
			var isFavorite: Bool
			var appliedNumber: String
			var schedules: String
			var questions: [String]
			var responsibilities: String
		}
	}
}
// swiftlint:enable nesting
