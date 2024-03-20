//
//  OffersCollection.swift
//  Test application
//
//  Created by Steven Kirke on 17.03.2024.
//

import SwiftUI

struct OffersCollection: View {

	let model: [MainSearchModel.ViewModel.Offer]

	var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack(spacing: 8) {
				ForEach(model.indices, id: \.self) { index in
					let offer = model[index]
					ServicesCard(modelOffer: offer)
				}
			}
		}
		.mask {
			RoundedRectangle(cornerRadius: 8.0)
		}
	}
}

private struct ServicesCard: View {

	let modelOffer: MainSearchModel.ViewModel.Offer

	var body: some View {
		GeometryReader { _ in
			VStack(alignment: .leading, spacing: 16) {
				Image("Images/Icons/iconTimeWork")
					.resizable()
					.scaledToFit()
					.frame(width: 32, height: 32)
				VStack(alignment: .leading, spacing: 0) {
					Text(modelOffer.title)
						.font(.system(size: 14, weight: .medium))
						.lineLimit(3)
						.foregroundColor(.white)

					if !modelOffer.button.isEmpty {
						Button(
							action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
							label: {
								Text(modelOffer.button)
									.foregroundColor(Color(hex: "4CB24E"))
									.font(.system(size: 14, weight: .regular))
							}
						)
					}
				}
			}
			.padding(.leading, 8)
			.padding(.trailing, 12)
			.padding(.top, 10)
		}
		.frame(width: 132, height: 120)
		.background(Color(hex: "222325"))
		.cornerRadius(8.0)
	}
}
