//
//  AppCoordinator.swift
//  Test application
//
//  Created by Steven Kirke on 18.03.2024.
//

import SwiftUI

protocol IShowJobPageSceneDelegate {
	func showJobPageScene()
}


enum Page: String, Identifiable {
	case contentFlow
	case massageFlow

	var id: String {
		self.rawValue
	}
}

enum FullScreenCover: String, Identifiable {
	case massageFlow

	var id: String {
		self.rawValue
	}
}

enum Sheet: String, Identifiable {
	case limon

	var id: String {
		self.rawValue
	}
}

final class AppCoordinator: ObservableObject {

	@StateObject var globalModel: GlobalFavoritesModel = GlobalFavoritesModel()
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
	func build(page: Page) -> some View {
		switch page {
		case .contentFlow:
			let assembler = AssemblerMainSearch()
			let view = assembler.configurator(globalModel: globalModel, delegate: self)
			view.environmentObject(globalModel)
		case .massageFlow:
			MainMassagesScene()
		}
	}
}

extension AppCoordinator: IShowJobPageSceneDelegate {
	func showJobPageScene() {
		build(page: .massageFlow)
	}
}
