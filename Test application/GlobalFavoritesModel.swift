//
//  GlobalFavoritesModel.swift
//  Test application
//
//  Created by Steven Kirke on 17.03.2024.
//

import Foundation


final class GlobalFavoritesModel: ObservableObject {
	@Published var count: Int = 0
	@Published var isAutorized: Bool = true
	
	func addVacancy() {
		count += 1
	}

	func removeVacancy() {
		count -= 1
	}
}
