//
//  LoginIterator.swift
//  Test application
//
//  Created by Steven Kirke on 21.03.2024.
//

import Foundation

protocol ILoginIterator: AnyObject {
	func nextView(eMail: String)
}

final class LoginIterator {
	let viewModel: ILoginViewModel

	// MARK: - Initialisation
	internal init(viewModel: ILoginViewModel) {
		self.viewModel = viewModel
	}
}

extension LoginIterator: ILoginIterator {
	func nextView(eMail: String) {
		viewModel.nextView(eMail: eMail)
	}
}
