//
//  JobPageViewModel.swift
//  Test application
//
//  Created by Steven Kirke on 20.03.2024.
//

import Foundation

protocol IJobPageViewModel: AnyObject {
	func presentJobPage(present: JobPageModel.Response)
	func backView()
}

final class JobPageViewModel: ObservableObject, IJobPageViewModel {

	@Published var modelJob: JobPageModel.ViewModel.Vacancy?
	@Published var modelTest: String = ""

	let declinationNumberService: IDeclinationNumberService
	let dateConvertService: IDateConvertService
	let backSceneHandler: IBackSceneDelegate
	let removeElementInTextService: IRemoveElementInTextService

	internal init(
		backSceneHandler: IBackSceneDelegate,
		declinationNumberService: IDeclinationNumberService,
		dateConvertService: IDateConvertService,
		removeElementInTextService: IRemoveElementInTextService
	) {
		self.backSceneHandler = backSceneHandler
		self.declinationNumberService = declinationNumberService
		self.dateConvertService =  dateConvertService
		self.removeElementInTextService = removeElementInTextService
	}

	func presentJobPage(present: JobPageModel.Response) {
		switch present {
		case .showJobPage(let jobPage):
			let model = convertModelForView(jobPage)
			self.modelJob = model
		case .failure(let error):
			print("Error \(error)")
		}
	}

	func backView() {
		backSceneHandler.backScene()
	}
}

private extension JobPageViewModel {
	func convertModelForView(
		_ responseModel: JobPageModel.Response.Vacancy
	) -> JobPageModel.ViewModel.Vacancy {
		JobPageModel.ViewModel.Vacancy(
			id: responseModel.id,
			lookingNumber: declinationLookingNumber(responseModel.lookingNumber),
			title: responseModel.title,
			address: assemblerAddress(responseModel.address),
			company: responseModel.company,
			description: convertDescription(responseModel.description),
			salary: responseModel.salary,
			experience: convertExperience(responseModel.experience),
			isFavorite: responseModel.isFavorite,
			appliedNumber: declinationAppliedNumber(responseModel.appliedNumber),
			schedules: uppercasedSchedules(responseModel.schedules),
			questions: convertQuestions(responseModel.questions),
			responsibilities: convertResponsibilities(responseModel.responsibilities)
		)
	}
}

private extension JobPageViewModel {
	func convertQuestions(_ questions: [String]) -> [String] {
		if !questions.isEmpty {
			return questions.map({ $0.trimmingCharacters(in: .whitespaces) })
		}
		return []
	}

	func convertResponsibilities(_ responsibilities: String) -> String {
		removeElementInTextService.removeExtraCharacter(text: responsibilities)
	}

	func convertDescription( _ description: String?) -> String {
		var assembler = ""
		if let currentDescription = description {
			assembler = removeElementInTextService.removeExtraCharacter(text: currentDescription)
		}
		return assembler
	}

	func assemblerAddress(_ address: JobPageModel.Response.Address) -> String {
		"\(address.town) \(address.street) \(address.house)"
	}

	func convertExperience(_ experience: String) -> String {
		var assembler = "Требуемый опыт: "
		let digitString = experience.filter { ("0"..."9").contains($0) }
		if !digitString.isEmpty && digitString.count == 2 {
			var first = String(digitString[digitString.startIndex])
			if first == "1" {
				first += " года"
			}
			let second = digitString[digitString.index(before: digitString.endIndex)]
			assembler += "от \(first) до \(second) лет"
		} else {
			assembler += "\(experience)"
		}
		return assembler
	}

	func uppercasedSchedules(_ schedules: [String]) -> String {
		var assembler = ""
		for (index, element) in schedules.enumerated() {
			if index == 0 {
				assembler += "\(element.prefix(1).uppercased() + element.dropFirst())"
			} else {
				assembler += ", \(element)"
			}
		}
		return assembler
	}

	func declinationLookingNumber(_ lookingNumber: Int?) -> String {
		var assembler = ""
		if let number = lookingNumber {
			if declinationNumberService.declinationNumberHuman(countHuman: number).isDeclination {
				assembler += "\(number) человека сейчас смотрят"
			} else {
				assembler += "\(number) человек сейчас смотрят"
			}
		}
		return assembler
	}

	func declinationAppliedNumber(_ appliedNumber: Int?) -> String {
		var assembler = ""
		if let number = appliedNumber {
			if declinationNumberService.declinationNumberHuman(countHuman: number).isDeclination {
				assembler += "\(number) человека уже откликнулись"
			} else {
				assembler += "\(number) человек уже откликнулись"
			}
		}
		return assembler
	}
}
