//
//  AssemblerLoginView.swift
//  Test application
//
//  Created by Steven Kirke on 21.03.2024.
//

import SwiftUI

final class AssemblerLoginView {
	func configurator(
		delegate: IShowPasswordSceneDelegate, globalModelFavorites: GlobalFavoritesModel
	) -> some View {
		let viewModel = LoginViewModel(showPasswordSceneDelegate: delegate)
		let iterator = LoginIterator(viewModel: viewModel)
		var viewController = LoginView()
		viewController.iterator = iterator
		viewController.environmentObject(globalModelFavorites)
		return viewController
	}
}
