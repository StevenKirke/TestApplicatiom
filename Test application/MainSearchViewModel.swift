//
//  MainSearchViewModel.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import Foundation

final class MainSearchViewModel: ObservableObject {

	@Published var modelVacancies: [MainSearchModel.ViewModel.Vacancy] = []
	@Published var modelOffers: [MainSearchModel.ViewModel.Offer] = []

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

	func nextScene() {
		showJobPageSceneDelegate.showJobPageScene()
	}
}
