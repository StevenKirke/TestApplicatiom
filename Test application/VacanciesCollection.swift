//
//  VacanciesCollection.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import SwiftUI

struct VacanciesCollection: View {
	@EnvironmentObject var globalModelFavorites: GlobalFavoritesModel
	@Binding var vacancyList: [MainSearchModel.ViewModel.Vacancy]
	@Binding var isMainVacancyViewController: Bool
	@Binding var currentID: String

	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			Text("Вакансии для вас")
				.customFont(style: .titleTwo)
				.foregroundColor(.white)
			ForEach(vacancyList.indices, id: \.self) { index in
				if index <= 2 {
					VacancyCard(
						modelVacancy: $vacancyList[index],
						isMainVacancyViewController: $isMainVacancyViewController,
						currentID: $currentID
					)
					.environmentObject(globalModelFavorites)
				}
			}
		}
	}

	private func reloadGlobalFavoritesModel() {
		globalModelFavorites.addVacancy()
	}
}

private struct VacancyCard: View {

	@EnvironmentObject var globalModelFavorites: GlobalFavoritesModel
	@State private var scale: Double = 1
	@Binding var modelVacancy: MainSearchModel.ViewModel.Vacancy
	@Binding var isMainVacancyViewController: Bool
	@Binding var currentID: String
	private let time: Double = 0.4

	var body: some View {
		VStack(spacing: 21) {
			VStack(alignment: .leading, spacing: 10) {
				LabelViews(
					countHuman: modelVacancy.lookingNumber,
					isFavorite: modelVacancy.isFavorite
				)
				.environmentObject(globalModelFavorites)
				Text(modelVacancy.title)
					.foregroundColor(Color.white)
					.customFont(style: .titleThree)
				LabelNameCompany(town: modelVacancy.address.town, company: modelVacancy.company)
				LabelExperience(experience: modelVacancy.experience)
				Text(modelVacancy.publishedDate)
					.foregroundColor(Color(hex: "858688"))
					.foregroundColor(Color.white)
			}
			Button(
				action: {},
				label: {
					Text("Откликнуться")
						.customFont(style: .textOne)
						.foregroundColor(.white)
						.frame(maxWidth: .infinity)
						.frame(height: 32)
						.background(Color(hex: "4CB24E"))
						.cornerRadius(50)
				}
			)
		}
		.padding()
		.background(Color(hex: "222325"))
		.cornerRadius(8.0)
		.scaleEffect(CGSize(width: scale, height: scale))
		.onTapGesture {
			currentID = modelVacancy.id
			scaleCard()
		}
		.onDisappear {
			scale = 1.0
		}
	}

	private func scaleCard() {
		DispatchQueue.main.async {
			withAnimation(.easeInOut(duration: time)) {
				scale = 0.95
			}
		}
		nextView()
	}

	private func nextView() {
		DispatchQueue.main.asyncAfter(deadline: .now() + time) {
			isMainVacancyViewController.toggle()
		}
	}
}

private struct LabelViews: View {

	@EnvironmentObject var globalModelFavorites: GlobalFavoritesModel
	let countHuman: String
	@State var isFavorite: Bool = false

	var body: some View {
		HStack(spacing: 8) {
			if !countHuman.isEmpty {
				Text("\(countHuman)")
					.foregroundColor(Color(hex: "4CB24E"))
					.customFont(style: .textOne)
			}
			Spacer()
			Button(
				action: {
					changeIsFavorite()
				},
				label: {
					Image(systemName: isFavorite ? "heart.fill" : "heart")
						.font(.system(size: 20))
						.foregroundColor(Color(hex: "2B7EFE"))
				}
			)
		}
		.foregroundColor(Color.white)
	}

	private func changeIsFavorite() {
		DispatchQueue.main.async {
			isFavorite.toggle()
			if isFavorite {
				globalModelFavorites.addVacancy()
			} else {
				globalModelFavorites.removeVacancy()
			}

		}
	}
}

private struct LabelExperience: View {

	let experience: String

	var body: some View {
		HStack(spacing: 8) {
			Image(systemName: "suitcase")
				.font(.system(size: 16))
				.foregroundColor(Color(hex: "DBDBDB"))
			Text(experience)
		}
		.foregroundColor(Color.white)
	}
}

private struct LabelNameCompany: View {

	let town: String
	let company: String

	var body: some View {
		VStack(alignment: .leading, spacing: 4) {
			Text(town)
			HStack(spacing: 8) {
				Text(company)
					.customFont(style: .textOne)
				Image("Images/Icons/IconClock")
					.resizable()
					.scaledToFit()
					.frame(width: 12)
			}
		}
		.foregroundColor(Color.white)
	}
}
