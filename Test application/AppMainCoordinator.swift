//
//  AppMainCoordinator.swift
//  Test application
//
//  Created by Steven Kirke on 18.03.2024.
//

import SwiftUI

final class AppMainCoordinator {

	// MARK: - Dependencies
	private var navigationController: UINavigationController
	private var window: UIWindow?

	// MARK: - Initializator
	internal init(window: UIWindow?) {
		self.window = window
		self.navigationController = UINavigationController()
	}

	// MARK: - Internal methods
	func start() {
		runMainFlow()
	}

	// MARK: - Public methods
	func runMainFlow() {
		let coordinator = MainMassagesScene()
	}
}
