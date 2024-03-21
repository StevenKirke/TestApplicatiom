//
//  PasswordIterator.swift
//  Test application
//
//  Created by Steven Kirke on 21.03.2024.
//

import Foundation

protocol IPasswordIterator: AnyObject {
	func showEMail()
	func nextView()
}

final class PasswordIterator {
	let viewModel: IPasswordViewModel
	let modelEMail: String

	// MARK: - Initialisation
	internal init(viewModel: IPasswordViewModel, modelEMail: String) {
		self.viewModel = viewModel
		self.modelEMail = modelEMail
	}
}

extension PasswordIterator: IPasswordIterator {
	func showEMail() {
		viewModel.showEMail(eMail: modelEMail)
	}

	func nextView() {
		viewModel.nextView()
	}
}
