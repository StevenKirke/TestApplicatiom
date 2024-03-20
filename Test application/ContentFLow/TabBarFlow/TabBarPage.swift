//
//  TabBarPage.swift
//  Test application
//
//  Created by Steven Kirke on 14.03.2024.
//

import Foundation

enum TabBarPage: Int, CaseIterable {
	case search
	case favourites
	case response
	case massage
	case profile

	var selectPage: Int {
		guard let contentIndex = TabBarPage.allTabBarPage.firstIndex(of: self) else { return .zero }
		return contentIndex
	}

	var title: String {
		var title = ""
		switch self {
		case .search:
			title = "Поиск"
		case .favourites:
			title = "Избранное"
		case .response:
			title = "Отклики"
		case .massage:
			title = "Сообщения"
		case .profile:
			title = "Профиль"
		}
		return title
	}

	var image: String {
		var image = "Images/Icons/"
		switch self {
		case .search:
			image += "iconSearch"
		case .favourites:
			image += "iconFavorites"
		case .response:
			image += "iconResponse"
		case .massage:
			image += "iconMassage"
		case .profile:
			image += "iconProfile"
		}
		return image
	}

	static let allTabBarPage: [TabBarPage] = [.search, .favourites, .response, .massage, .profile]
	static let firstPage: TabBarPage = .search
}
