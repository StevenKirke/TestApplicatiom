//
//  MainSearchView.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import SwiftUI

struct MainSearchView: View {

	@EnvironmentObject var globalModelFavorites: GlobalFavoritesModel
	@ObservedObject var mainSearchViewModel: MainSearchViewModel

	// MARK: - Dependencies
	var iterator: MainSearchIterator?

	@State var isMainVacancyViewController: Bool = false
	@State var currentID: String = ""

	var body: some View {
			ZStack {
				Color(hex: "0C0C0C")
					.edgesIgnoringSafeArea(.all)
				VStack(spacing: 0) {
					ScrollView(.vertical, showsIndicators: false) {
						SearchFilterView()
						OffersCollection(model: mainSearchViewModel.modelOffers)
						VacanciesCollection(
							vacancyList: $mainSearchViewModel.modelVacancies,
							isMainVacancyViewController: $isMainVacancyViewController,
							currentID: $currentID
						)
						.environmentObject(globalModelFavorites)
						.padding(.top, 16)
						Button(
							action: {
							},
							label: {
								Text("Еще \(mainSearchViewModel.countVacancies)")
									.customFont(style: .textOne)
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
				.onChange(of: isMainVacancyViewController) { _ in
					iterator?.nextView(id: currentID)
				}
			}
			.navigationBarTitle("", displayMode: .inline)
			.navigationBarBackButtonHidden(true)
	}
}
