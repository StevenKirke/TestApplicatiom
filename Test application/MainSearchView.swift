//
//  MainSearchView.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import SwiftUI

struct MainSearchView: View {

	@EnvironmentObject var globalModel: GlobalFavoritesModel
	@ObservedObject var mainSearchViewModel: MainSearchViewModel

	// MARK: - Dependencies
	var iterator: MainSearchIterator?

	@State var isMainVacancyViewController: Bool = false

	var body: some View {
		NavigationStack {
			ZStack {
				Color(hex: "0C0C0C")
					.edgesIgnoringSafeArea(.all)
				VStack(spacing: 0) {
					ScrollView(.vertical, showsIndicators: false) {
						SearchFilterView()
						OffersCollection(model: mainSearchViewModel.modelOffers)
						VacanciesCollection(
							vacancyList: $mainSearchViewModel.modelVacancies,
							isMainVacancyViewController: $isMainVacancyViewController
						)
						.environmentObject(globalModel)
							.padding(.top, 16)
						Button(
							action: {
							},
							label: {
								Text("conjugationVacancy()")
									.font(.system(size: 14, weight: .regular))
									.foregroundColor(.white)
									.frame(maxWidth: .infinity)
									.frame(height: 48)
									.background(Color(hex: "2B7EFE"))
									.cornerRadius(8)
							}
						)
					}
					.mask {
						RoundedRectangle(cornerRadius: 8.0)
					}
				}
				.padding(.horizontal)
				.padding(.bottom, 60)
				.onAppear {
					iterator?.fitchVacancies()
				}
				.onChange(of: isMainVacancyViewController) { _ in
					iterator?.nextView()
				}
			}
			.navigationBarTitle("", displayMode: .inline)
			.navigationBarBackButtonHidden(true)
		}
	}

//	private func conjugationVacancy() -> String {
//		var title: String = "Еще "
//		let count = mainSearchViewModel.modelVacancies.count
//		let countString = String(count)
//		let last = countString[countString.index(before: countString.endIndex)]
//		let convertString = String(last)
//		switch (convertString, count) {
//		case (_, 11):
//			title += "\(count) вакансии"
//		case ("1", _):
//			title += "\(count) вакансия"
//		default:
//			title += "\(count) вакансии"
//		}
//		return title
//	}
}
//
//#if DEBUG
//struct MainVacancyScene_Previews: PreviewProvider {
//	static var globalModel: GlobalFavoritesModel = GlobalFavoritesModel()
//	static var previews: some View {
//		//MainSearchView().environmentObject(globalModel)
//	}
//}
//#endif
