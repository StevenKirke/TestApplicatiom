//
//  AppCoordinatorView.swift
//  Test application
//
//  Created by Steven Kirke on 18.03.2024.
//

import SwiftUI

struct TabBarCoordinatorView: View {
	@StateObject var globalModelFavorites = GlobalFavoritesModel()
	@StateObject private var tabBarCoordinator = TabBarCoordinator()

	var body: some View {
			ZStack {
				tabBarCoordinator.build(tabBarCoordinator.tabBarPage)
					.environmentObject(globalModelFavorites)
				VStack(spacing: 0) {
					Spacer()
					TabBarView()
						.environmentObject(tabBarCoordinator)
						.environmentObject(globalModelFavorites)
				}
			}
		.edgesIgnoringSafeArea(.top)
	}
}
