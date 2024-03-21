//
//  TabBarCoordinator.swift
//  Test application
//
//  Created by Steven Kirke on 21.03.2024.
//

import SwiftUI

final class TabBarCoordinator: ObservableObject {

	@Published var tabBarPage: TabBarPage = .searchFlow

	func changePage(_ page: TabBarPage, globalModelFavorites: GlobalFavoritesModel) {
		self.tabBarPage = page
	}

	@ViewBuilder
	func build(_ page: TabBarPage) -> some View {
		switch tabBarPage {
		case .searchFlow:
			SearchCoordinatorView()
		case .favoriteFlow:
			let assembler = AssemblerMainFavorites()
			assembler.configurator()
		case .responseFlow:
			let assembler = AssemblerMainResponse()
			assembler.configurator()
		case .massageFlow:
			let assembler = AssemblerMainMassage()
			assembler.configurator()
		case .profileFlow:
			let assembler = AssemblerMainProfile()
			assembler.configurator()
		}
	}
}
