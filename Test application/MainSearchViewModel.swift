//
//  MainSearchViewModel.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import Foundation

protocol IMainSearchViewModel: AnyObject {
	func presentVacancies(present: [MainSearchModel.Response.Vacancy])
	func presentOffers(present: [MainSearchModel.Response.Offer])
	func precentCounterVacancies(present: String)
	func nextScene(id: String)
}

final class MainSearchViewModel: ObservableObject, IMainSearchViewModel {

	@Published var modelVacancies: [MainSearchModel.ViewModel.Vacancy] = []
	@Published var modelOffers: [MainSearchModel.ViewModel.Offer] = []
	@Published var countVacancies: String = ""

	private var showJobPageSceneDelegate: IShowJobPageSceneDelegate

	internal init(showJobPageSceneDelegate: IShowJobPageSceneDelegate) {
		self.showJobPageSceneDelegate = showJobPageSceneDelegate
	}

	func presentVacancies(present: [MainSearchModel.Response.Vacancy]) {
		let model = present.map { MainSearchModel.ViewModel.Vacancy(from: $0) }
		self.modelVacancies = model
	}

	func presentOffers(present: [MainSearchModel.Response.Offer]) {
		let model = present.map { MainSearchModel.ViewModel.Offer(from: $0) }
		self.modelOffers = model
	}

	func precentCounterVacancies(present: String) {
		self.countVacancies = present
	}

	func nextScene(id: String) {
		showJobPageSceneDelegate.showJobPageScene(id: id)
	}
}
