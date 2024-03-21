//
//  IConvertorOffersDTO.swift
//  Test application
//
//  Created by Steven Kirke on 20.03.2024.
//

import Foundation

protocol IConvertorOffersDTO: AnyObject {
	func converterModel(modelDTO: [OfferDTO]) -> [MainSearchModel.Response.Offer]
}

final class ConvertorOffersDTO {
	func convertModelDTO(modelDTO: [OfferDTO]) -> [MainSearchModel.Response.Offer] {
		converterModel(modelDTO: modelDTO)
	}
}

extension ConvertorOffersDTO: IConvertorOffersDTO {
	func converterModel(modelDTO: [OfferDTO]) -> [MainSearchModel.Response.Offer] {
		modelDTO.map {
			MainSearchModel.Response.Offer(
				id: $0.id ?? "",
				title: trimText(text: $0.title),
				button: $0.button?.text ?? ""
			)
		}
	}
}

private extension ConvertorOffersDTO {
	func trimText(text: String) -> String {
		text.trimmingCharacters(in: .whitespaces)
	}
}
