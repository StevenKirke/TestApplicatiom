//
//  TabBarView.swift
//  Test application
//
//  Created by Steven Kirke on 14.03.2024.
//

import SwiftUI

struct TabBarView: View {
	@EnvironmentObject var globalModel: GlobalFavoritesModel
	@State var safeAreaBottom: CGFloat = .zero
	@State var favoriteCount: Int = 1
	@Binding var currentItem: TabBarPage

	var body: some View {
		VStack(spacing: 0) {
			HStack(spacing: 0) {
				ForEach(TabBarPage.allCases, id: \.self) { item in
					Button {
						changeTabBarItem(item: item)
					} label: {
						ButtonTabBar(item: item, content: checkFavourite(item, count: globalModel.count))
							.foregroundColor(self.currentItem == item ? Color.blue : Color.white)
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
				self.currentItem = item
			}
		}
	}

	private func checkFavourite(_ item: TabBarPage, count: Int) -> AnyView {
		if item == .favourites && count != 0 {
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
				.font(.system(size: 10, weight: .regular))
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

#if DEBUG
struct TabBarView_Previews: PreviewProvider {
	static var previews: some View {
		TabBarView(currentItem: .constant(.search))
	}
}
#endif
