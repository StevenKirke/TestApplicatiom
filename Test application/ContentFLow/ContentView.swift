//
//  ContentView.swift
//  Test application
//
//  Created by Steven Kirke on 14.03.2024.
//

import SwiftUI

/*
struct ContentView: View {
	@EnvironmentObject var globalModel: GlobalFavoritesModel
	@ObservedObject var contentVM: ContentViewModel

	var body: some View {
		ZStack {
			Color(hex: "0C0C0C")
			CurrentView(contentVM: contentVM, isAutorized: $globalModel.isAutorized)
				.environmentObject(globalModel)
			TabBarView(currentItem: $contentVM.itemMenu)
				.frame(maxHeight: .infinity, alignment: .bottom)
				.environmentObject(globalModel)
		}
		.ignoresSafeArea(edges: .all)
	}
}

private struct CurrentView: View {
	@EnvironmentObject var globalModel: GlobalFavoritesModel
	@ObservedObject var contentVM: ContentViewModel
	@Binding var isAutorized: Bool

	var body: some View {
		VStack(spacing: 0) {
			switch (contentVM.itemMenu, isAutorized) {
			case (.search, true):  EmptyView()// MainSearchView()
			case (.favourites, true): MainFavoritesScene()
			case (.response, true): MainResponseScene()
			case (.massage, true): MainMassagesScene()
			case (.profile, true): MainProfileScene()
			case (_, false): LoginView().environmentObject(globalModel)
			}
		}
	}
}
*/
