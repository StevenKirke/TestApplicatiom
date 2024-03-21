//
//  JobPageWorker.swift
//  Test application
//
//  Created by Steven Kirke on 20.03.2024.
//

import Foundation

protocol IJobPageWorker: AnyObject {
	func getVacancy(vacancyID: String, requestModel: @escaping (Result<JobPageModel.Response.Vacancy, Error>) -> Void)
}

final class JobPageWorker: IJobPageWorker {

	let assemblerURL: AssemblerURLService
	let decodeJSONManager: IDecodeJsonManager
	let networkManager: INetworkManager
	let convertorVacancyDTO: IConvertVacancyDTO

	init(
		assemblerURL: AssemblerURLService,
		decodeJSONManager: IDecodeJsonManager,
		networkManager: INetworkManager,
		convertorVacancyDTO: IConvertVacancyDTO
	) {
		self.assemblerURL = assemblerURL
		self.decodeJSONManager = decodeJSONManager
		self.networkManager = networkManager
		self.convertorVacancyDTO = convertorVacancyDTO
	}

	func getVacancy(vacancyID: String, requestModel: @escaping (Result<JobPageModel.Response.Vacancy, Error>) -> Void) {
		let url = assemblerURL.assemblerVacancyList()
		networkManager.getDataURL(url: url) { resultData in
			switch resultData {
			case .success(let data):
				self.decode(data: data) { modelDTO in
					switch modelDTO {
					case .success(let vacanciesDTO):
						let vacancies = vacanciesDTO.vacancies
						if let model = vacancies.first(where: { $0.id == vacancyID}) {
							let convertModel = self.convertorVacancyDTO.converterModel(modelDTO: model)
							requestModel(.success(convertModel))
						}
					case .failure(let error):
						requestModel(.failure(error))
					}
				}
			case .failure(let error):
				requestModel(.failure(error))
			}
		}
	}
}

// MARK: - Decode JSON.
private extension JobPageWorker {
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
