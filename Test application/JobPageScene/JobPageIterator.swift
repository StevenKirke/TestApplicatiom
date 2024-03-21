//
//  JobPageIterator.swift
//  Test application
//
//  Created by Steven Kirke on 20.03.2024.
//

import Foundation

protocol IJobPageIterator: AnyObject {
	func getJob()
	func backScene()
}

final class JobPageIterator {

	let viewModel: IJobPageViewModel
	let worker: IJobPageWorker
	let modelVacancyID: String

	// MARK: - Initialisation
	internal init(
		viewModel: IJobPageViewModel,
		modelVacancyID: String,
		worker: IJobPageWorker
	) {
		self.viewModel = viewModel
		self.modelVacancyID = modelVacancyID
		self.worker = worker
	}
}

extension JobPageIterator: IJobPageIterator {
	func backScene() {
		viewModel.backView()
	}

	func getJob() {
		worker.getVacancy(vacancyID: modelVacancyID) { [weak self] responseModel in
			guard let self = self else { return }
			switch responseModel {
			case .success(let model):
				self.viewModel.presentJobPage(present: .showJobPage(model))
			case .failure(let error):
				self.viewModel.presentJobPage(present: .failure(error))
			}
		}
	}
}
