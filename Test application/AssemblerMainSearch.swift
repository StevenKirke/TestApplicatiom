//
//  AssemblerMainSearch.swift
//  Test application
//
//  Created by Steven Kirke on 17.03.2024.
//

import SwiftUI

final class AssemblerMainSearch {
	func configurator(
		delegate: IShowJobPageSceneDelegate, globalModelFavorites: GlobalFavoritesModel) -> some View {
			print("AssemblerMainSearch \(globalModelFavorites.count)")
		// Сервисы.
		let declinationNumberService = DeclinationNumberService()
		let dateConvertService = DateConvertService()
		let convertorCounterVacancies = ConvertCounterVacanciesService()
		let assemblerURL = AssemblerURLService()
		// Менеджер работы с сетью.
		let networkManager = NetworkManager()
		// Менеджер работы с JSON.
		let jsonManager = DecodeJsonManager()
		// Конвекторы.
		let convertorVacancyDTO = ConvertorVacanciesDTO(
			declinationNumberService: declinationNumberService,
			dateConvertService: dateConvertService)
		let convertorOfferDTO = ConvertorOffersDTO()
		// Сборщик URL.

		let worker = MainSearchWorker(
			assemblerURL: assemblerURL,
			decodeJSONManager: jsonManager,
			networkManager: networkManager,
			convertorVacancyDTO: convertorVacancyDTO,
			convertorOffersDTO: convertorOfferDTO,
			convertorCounterVacancies: convertorCounterVacancies
			)

		// Сборщик VIP.
		let viewModel = MainSearchViewModel(showJobPageSceneDelegate: delegate)
		let iterator = MainSearchIterator(viewModel: viewModel, worker: worker)
		iterator.fitchVacancies()
		var viewController = MainSearchView(mainSearchViewModel: viewModel)
		viewController.iterator = iterator
		viewController.environmentObject(globalModelFavorites)
			
		return viewController

	}
}
