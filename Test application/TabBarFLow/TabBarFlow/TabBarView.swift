//
//  TabBarView.swift
//  Test application
//
//  Created by Steven Kirke on 14.03.2024.
//

import SwiftUI

struct TabBarView: View {
	@EnvironmentObject var globalModelFavorites: GlobalFavoritesModel
	@EnvironmentObject var tabBarCoordinator: TabBarCoordinator
	@State var safeAreaBottom: CGFloat = .zero

	var body: some View {
		VStack(spacing: 0) {
			HStack(spacing: 0) {
				ForEach(TabBarPage.allCases, id: \.self) { item in
					Button {
						if globalModelFavorites.isAuthorized {
							changeTabBarItem(item: item)
							tabBarCoordinator.changePage(item, globalModelFavorites: globalModelFavorites)
						}
					} label: {
						ButtonTabBar(item: item, content: checkFavourite(item, count: globalModelFavorites.count))
							.foregroundColor(tabBarCoordinator.tabBarPage == item ? Color.blue : Color.white)
					}
					.frame(maxWidth: .infinity, maxHeight: 54)
				}
			}
		}
		.padding(.top, 6)
		.onAppear {
			safeAreaBottom = GetSaveAreaInset.getSaveAreaInset()
		}
		.padding(.bottom, safeAreaBottom)
		.background(Color.black)
	}

	private func changeTabBarItem(item: TabBarPage) {
		DispatchQueue.main.async {
			withAnimation(.easeInOut) {
				tabBarCoordinator.changePage(item, globalModelFavorites: globalModelFavorites)
			}
		}
	}

	private func checkFavourite(_ item: TabBarPage, count: Int) -> AnyView {
		if item == .favoriteFlow && count != 0 {
			return AnyView(FavoriteCountView(count: count))
		} else {
			return AnyView(EmptyView())
		}
	}
}

private struct ButtonTabBar<Content: View>: View {

	let item: TabBarPage
	let content: Content

	var body: some View {
		VStack(spacing: 3) {
			GeometryReader { proxy in
				let size = proxy.frame(in: .local)
				ZStack {
					Image(item.image)
						.resizable()
						.scaledToFit()
					content
						.offset(x: size.midX, y: -size.midY / 2)
				}
			}
			.frame(width: 24, height: 24)
			Text(item.title)
				.customFont(style: .tabText)
		}
	}
}

struct FavoriteCountView: View {

	let count: Int

	var body: some View {
		ZStack {
			Circle()
				.fill(Color(hex: "FF0000"))
				.frame(height: 13)
			Text("\(count)")
				.font(.system(size: 7, weight: .regular))
		}
	}
}
