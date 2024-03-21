//
//  PasswordViewModel.swift
//  Test application
//
//  Created by Steven Kirke on 21.03.2024.
//

import Foundation

protocol IPasswordViewModel: AnyObject {
	func showEMail(eMail: String)
	func nextView()
}

final class PasswordViewModel: ObservableObject, IPasswordViewModel {

	@Published var email: String = ""
	private var showSearchSceneDelegate: IShowSearchSceneDelegate

	internal init(showSearchSceneDelegate: IShowSearchSceneDelegate) {
		self.showSearchSceneDelegate = showSearchSceneDelegate
	}

	func showEMail(eMail: String) {
		self.email = eMail
	}

	func nextView() {
		showSearchSceneDelegate.showSearchScene()
	}
}
