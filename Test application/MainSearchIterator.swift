//
//  MainSearchIterator.swift
//  Test application
//
//  Created by Steven Kirke on 18.03.2024.
//

import Foundation

protocol IMainSearchIterator: AnyObject {
	func fitchVacancies()
	func nextView(id: String)
}

final class MainSearchIterator {

	// MARK: - Dependencies
	let worker: IMainSearchWorker
	let viewModel: IMainSearchViewModel

	// MARK: - Initializator
	internal init(
		viewModel: IMainSearchViewModel,
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
				if case let .showCountVacancy(counterVacancies) = model {
					self.viewModel.precentCounterVacancies(present: counterVacancies)
				}
			case .failure(let error):
				#warning("TODO: Обработка ошибки. Модальное окно или другой вид взаимодействия")
				print("Error from Worker \(error.localizedDescription)")
			}
		}
	}

	func nextView(id: String) {
		viewModel.nextScene(id: id)
	}
}
