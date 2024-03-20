//
//  AssemblerMainSearch.swift
//  Test application
//
//  Created by Steven Kirke on 17.03.2024.
//

import SwiftUI

final class AssemblerMainSearch {

	@EnvironmentObject private var coordinator: AppCoordinator

	func configurator(globalModel: GlobalFavoritesModel, delegate: IShowJobPageSceneDelegate) -> some View {
		// Менеджер работы с сетью.
		let networkManager = NetworkManager()
		// Менеджер работы с JSON.
		let jsonManager = DecodeJsonManager()
		// Конвекторы.
		let convertorVacancyDTO = ConvertorVacanciesDTO()
		let convertorOfferDTO = ConvertorOffersDTO()
		// Сборщик URL.
		let assemblerURL = AssemblerURLService()

		let worker = MainSearchWorker(
			assemblerURL: assemblerURL,
			decodeJSONManager: jsonManager,
			networkManager: networkManager,
			convertorVacancyDTO: convertorVacancyDTO,
			convertorOffersDTO: convertorOfferDTO
			)

		// Сборщик VIP.
		let viewModel = MainSearchViewModel(showJobPageSceneDelegate: delegate)
		let iterator = MainSearchIterator(viewModel: viewModel, worker: worker)
		var viewController = MainSearchView(mainSearchViewModel: viewModel)

		viewController.iterator = iterator

		return viewController

	}
}

/*
 final class AssemblerMain {
	 func configurator(globalModel: GlobalFavoritesModel) -> some View {

		 // Сервис по работе с Mock данными.
		 let mockData = AdditionalServices()
		 // Менеджер работы с сетью.
		 let networkManager = NetworkManager()
		 // Менеджер работы с JSON.
		 let jsonManager = DecodeJsonManager()
		 // Конвекторы.
		 let countHumanConvert = DeclinationHuman()
		 let dataConvert = TimeConvertServices()
		 // Сборщик URL.
		 let assemblerURL = AssemblerURLService()

		 let worker = MainVacancyWorker(
			 mockManager: mockData,
			 decodeJSONManager: jsonManager,
			 networkManager: networkManager
		 )

		 let viewModel = ContentViewModel(worker: worker)
		 let viewController = ContentView(contentVM: viewModel).environmentObject(globalModel)
		 return viewController
	 }
 }

 */
