//
//  SearchCoordinatorView.swift
//  Test application
//
//  Created by Steven Kirke on 21.03.2024.
//

import SwiftUI

struct SearchCoordinatorView: View {

	@EnvironmentObject var globalModelFavorites: GlobalFavoritesModel
	@StateObject private var coordinator = SearchCoordinator()

	var body: some View {
		NavigationStack(path: self.$coordinator.path) {
			self.coordinator.build(page: .loginScene, globalModelFavorites: globalModelFavorites)
				.navigationDestination(for: Page.self) { page in
					self.coordinator.build(page: page, globalModelFavorites: globalModelFavorites)
				}
		}
		.environmentObject(self.coordinator)
		.edgesIgnoringSafeArea(.top)
	}
}
