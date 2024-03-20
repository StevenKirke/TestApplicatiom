//
//  MainSearchIterator.swift
//  Test application
//
//  Created by Steven Kirke on 18.03.2024.
//

import Foundation

protocol IMainSearchIterator: AnyObject {
	func fitchVacancies()
	func nextView()
}

final class MainSearchIterator {

	// MARK: - Dependencies
	let worker: IMainSearchWorker
	let viewModel: MainSearchViewModel

	// MARK: - Initializator
	internal init(
		viewModel: MainSearchViewModel,
		worker: IMainSearchWorker
	) {
		self.viewModel = viewModel
		self.worker = worker
	}
}

extension MainSearchIterator: IMainSearchIterator {
	func fitchVacancies() {
		worker.getVacancyList { [weak self] response in
			guard let self = self else { return }
			switch response {
			case .success(let model):
				if case let .showVacancies(vacancies) = model {
					self.viewModel.presentVacancies(present: vacancies)
				}
				if case let .showOffers(offers) = model {
					self.viewModel.presentOffers(present: offers)
				}
			case .failure(let error):
				print("Error from Worker \(error.localizedDescription)")
			}
		}
	}

	func nextView() {
		viewModel.nextScene()
	}
}
