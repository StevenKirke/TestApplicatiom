//
//  MainSearchModel.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

// swiftlint:disable nesting
enum MainSearchModel {
	enum Request {
		case success(Device)
		case failure(Error)

		struct Device {
			let deviceID: Int
			let parentID: Int
			let name: String
		}
	}

	enum Response {
		case showVacancies([Vacancy])
		case showOffers([Offer])
		case failure

		struct Vacancy {
			let id: String?
			let lookingNumber: String
			let title: String
			let address: Address
			let company: String
			let experience: String
			let publishedDate: String
			var isFavorite: Bool
			let appliedNumber: Int?
		}

		struct Address: Codable {
			let town, street, house: String
		}

		struct Offer: Codable {
			let id: String?
			let title: String
			let button: String
		}
	}

	enum ViewModel {
		case showVacancyList([Vacancy])
		case failure

		struct Vacancy {
			let id: String?
			let lookingNumber: String
			let title: String
			let address: Address
			let company: String
			let experience: String
			let publishedDate: String
			var isFavorite: Bool
			let appliedNumber: Int?
		}

		struct Address: Codable {
			let town: String
		}

		struct Offer: Codable {
			let id: String?
			let title: String
			let button: String
		}
	}
}
// swiftlint:enable nesting

// MARK: - Vacancy
extension MainSearchModel.ViewModel.Vacancy {
	init(from: MainSearchModel.Response.Vacancy) {
		self.init(
			id: from.id,
			lookingNumber: from.lookingNumber,
			title: from.title,
			address: MainSearchModel.ViewModel.Address(from: from.address),
			company: from.company,
			experience: from.experience,
			publishedDate: from.publishedDate,
			isFavorite: from.isFavorite,
			appliedNumber: from.appliedNumber)
	}
}

extension MainSearchModel.ViewModel.Address {
	init(from: MainSearchModel.Response.Address) {
		self.init(town: from.town)
	}
}

// MARK: - Offer
extension MainSearchModel.ViewModel.Offer {
	init(from: MainSearchModel.Response.Offer) {
		self.init(id: from.id, title: from.title, button: from.button)
	}
}
