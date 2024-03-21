//
//  LoginViewModel.swift
//  Test application
//
//  Created by Steven Kirke on 21.03.2024.
//

import Foundation

protocol ILoginViewModel: AnyObject {
	func nextView(eMail: String)
}

final class LoginViewModel: ObservableObject, ILoginViewModel {

	private var showPasswordSceneDelegate: IShowPasswordSceneDelegate

	internal init(showPasswordSceneDelegate: IShowPasswordSceneDelegate) {
		self.showPasswordSceneDelegate = showPasswordSceneDelegate
	}

	func nextView(eMail: String) {
		self.showPasswordSceneDelegate.showPasswordScene(eMail: eMail)
	}
}
