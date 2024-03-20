//
//  MainVacancyWorker.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import Foundation


protocol IMainSearchWorker: AnyObject {
	func getVacancyList(response: @escaping (Result<MainSearchModel.Response, Error>) -> Void)
}

final class MainSearchWorker: IMainSearchWorker {
	let assemblerURL: AssemblerURLService
	let decodeJSONManager: IDecodeJsonManager
	let networkManager: INetworkManager
	let convertorVacancyDTO: IConvertorVacanciesDTO
	let convertorOffersDTO: IConvertorOffersDTO

	init(
		assemblerURL: AssemblerURLService,
		decodeJSONManager: IDecodeJsonManager,
		networkManager: INetworkManager,
		convertorVacancyDTO: IConvertorVacanciesDTO,
		convertorOffersDTO: IConvertorOffersDTO
	) {
		self.assemblerURL = assemblerURL
		self.decodeJSONManager = decodeJSONManager
		self.networkManager = networkManager
		self.convertorVacancyDTO = convertorVacancyDTO
		self.convertorOffersDTO = convertorOffersDTO
	}

	func getVacancyList(response: @escaping (Result<MainSearchModel.Response, Error>) -> Void) {
		let url = assemblerURL.assemblerVacancyList()
		networkManager.getDataURL(url: url) { [weak self] resultData in
			guard let self = self else { return }
			switch resultData {
			case .success(let data):
				self.decode(data: data) { modelDTO in
					switch modelDTO {
					case .success(let modelDTO):
						let vacancies = modelDTO.vacancies
						let modeVacancies = self.convertorVacancyDTO.converterModel(modelDTO: vacancies)
						response(.success(.showVacancies(modeVacancies)))
						let offers = modelDTO.offers
						let modelOffers = self.convertorOffersDTO.converterModel(modelDTO: offers)
						response(.success(.showOffers(modelOffers)))
					case .failure(let error):
						response(.failure(error))
					}
				}
			case .failure(let error):
				response(.failure(error))
			}
		}
	}
}

// MARK: - Decode JSON.
private extension MainSearchWorker {
	func decode(data: Data, result: @escaping (Result<VacancyListDTO, Error>) -> Void) {
		decodeJSONManager.decodeJSON(data: data, model: VacancyListDTO.self) { resultJSON in
			switch resultJSON {
			case .success(let json):
				result(.success(json))
			case .failure(let error):
				result(.failure(error))
			}
		}
	}
}
