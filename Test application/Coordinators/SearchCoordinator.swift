//
//  SearchCoordinator.swift
//  Test application
//
//  Created by Steven Kirke on 18.03.2024.
//

import SwiftUI

protocol IShowJobPageSceneDelegate: AnyObject {
	func showJobPageScene(id: String)
}

protocol IShowPasswordSceneDelegate: AnyObject {
	func showPasswordScene(eMail: String)
}

protocol IShowSearchSceneDelegate: AnyObject {
	func showSearchScene()
}

protocol IBackSceneDelegate: AnyObject {
	func backScene()
}

enum Page: Hashable {
	case loginScene
	case passwordScene(String)
	case vacancyScene
	case jobScene(String)
}

final class SearchCoordinator: ObservableObject {

	@EnvironmentObject var globalModelFavorites: GlobalFavoritesModel
	// @Published var tabBarPage: Page = .loginScene
	@Published var path: NavigationPath = NavigationPath()

	func push(_ page: Page) {
	    path.append(page)
	}

	func pop() {
		path.removeLast()
	}

	func popToRoot() {
		path.removeLast(path.count)
	}


	@ViewBuilder
	func build(page: Page, globalModelFavorites: GlobalFavoritesModel) -> some View {
		switch page {
		case .loginScene:
			if globalModelFavorites.isAuthorized {
				let assembler = AssemblerMainSearch()
				assembler.configurator(delegate: self, globalModelFavorites: globalModelFavorites)
			} else {
				let assembler = AssemblerLoginView()
				assembler.configurator(delegate: self, globalModelFavorites: globalModelFavorites)
			}
		case .passwordScene(let email):
			let assembler = AssemblerPasswordView()
			assembler.configurator(
				delegate: self,
				modelDTO: email
			)
		case .vacancyScene:
			let assembler = AssemblerMainSearch()
			assembler.configurator(delegate: self, globalModelFavorites: globalModelFavorites)
		case .jobScene(let vacancyID):
			let assembler = AssemblerJobPage()
			assembler.configurator(backSceneDelegate: self, modelDTO: vacancyID)
		}
	}

}

extension SearchCoordinator: IShowJobPageSceneDelegate {
	func showJobPageScene(id: String) {
		self.push(.jobScene(id))
	}
}

extension SearchCoordinator: IBackSceneDelegate {
	func backScene() {
		self.pop()
	}
}

extension SearchCoordinator: IShowPasswordSceneDelegate {
	func showPasswordScene(eMail: String) {
		self.push(.passwordScene(eMail))
	}
}

extension SearchCoordinator: IShowSearchSceneDelegate {
	func showSearchScene() {
		push(.vacancyScene)
	}
}
