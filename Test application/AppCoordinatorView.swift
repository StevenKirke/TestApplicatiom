//
//  AppCoordinatorView.swift
//  Test application
//
//  Created by Steven Kirke on 18.03.2024.
//

import SwiftUI

struct CoordinatorView: View {

	@StateObject private var coordinator = AppCoordinator()

	var body: some View {
		NavigationStack(path: $coordinator.path) {
			coordinator.build(page: .contentFlow)
				.navigationDestination(for: Page.self) { page in
					coordinator.build(page: page)
				}
			/*
				.sheet(item: $coordinator.sheet) { sheet in
					coordinator.build(sheet: sheet)
				}
				.fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
					coordinator.build(fullScreenCover: fullScreenCover)
				}
			 */
		}
		.environmentObject(coordinator)
	}
}
