//
//  AssemblerJobPage.swift
//  Test application
//
//  Created by Steven Kirke on 20.03.2024.
//

import SwiftUI

final class AssemblerJobPage {
	func configurator(backSceneDelegate: IBackSceneDelegate, modelDTO: String) -> some View {

		let declinationNumberService = DeclinationNumberService()
		let dateConvertService = DateConvertService()
		let convertorCounterVacancies = ConvertCounterVacanciesService()
		let removeElementInTextService = RemoveElementInTextService()
		// Менеджер работы с сетью.
		let networkManager = NetworkManager()
		// Менеджер работы с JSON.
		let jsonManager = DecodeJsonManager()

		// Конверторы
		let convertorDTO = ConvertVacancyDTO()
		// Сборщик URL.
		let assemblerURL = AssemblerURLService()

		let worker = JobPageWorker(
			assemblerURL: assemblerURL,
			decodeJSONManager: jsonManager,
			networkManager: networkManager,
			convertorVacancyDTO: convertorDTO
		)

		let viewModel = JobPageViewModel(
			backSceneHandler: backSceneDelegate,
			declinationNumberService: declinationNumberService,
			dateConvertService: dateConvertService,
			removeElementInTextService: removeElementInTextService
		)
		let iterator = JobPageIterator(
			viewModel: viewModel,
			modelVacancyID: modelDTO,
			worker: worker
		)
		iterator.getJob()
		var viewController = JobPageView(jobPageViewModel: viewModel)

		viewController.iterator = iterator

		return viewController
	}
}
