//
//  AssemblerPasswordView.swift
//  Test application
//
//  Created by Steven Kirke on 21.03.2024.
//

import SwiftUI

final class AssemblerPasswordView {
	func configurator(
		delegate: IShowSearchSceneDelegate,
		modelDTO: String
	) -> some View {
		let viewModel = PasswordViewModel(showSearchSceneDelegate: delegate)
		let iterator = PasswordIterator(viewModel: viewModel, modelEMail: modelDTO)
		iterator.showEMail()

		var viewController = PasswordView(passwordVM: viewModel)
		viewController.iterator = iterator

		return viewController
	}
}
