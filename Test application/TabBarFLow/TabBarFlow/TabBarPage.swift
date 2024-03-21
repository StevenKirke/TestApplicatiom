//
//  TabBarPage.swift
//  Test application
//
//  Created by Steven Kirke on 14.03.2024.
//

import Foundation

enum TabBarPage: Int, CaseIterable, Hashable {
	case searchFlow
	case favoriteFlow
	case responseFlow
	case massageFlow
	case profileFlow

	var title: String {
		var title = ""
		switch self {
		case .searchFlow:
			title = "Поиск"
		case .favoriteFlow:
			title = "Избранное"
		case .responseFlow:
			title = "Отклики"
		case .massageFlow:
			title = "Сообщения"
		case .profileFlow:
			title = "Профиль"
		}
		return title
	}

	var image: String {
		var image = "Images/Icons/"
		switch self {
		case .searchFlow:
			image += "iconSearch"
		case .favoriteFlow:
			image += "iconFavorites"
		case .responseFlow:
			image += "iconResponse"
		case .massageFlow:
			image += "iconMassage"
		case .profileFlow:
			image += "iconProfile"
		}
		return image
	}

//	static let allTabBarPage: [TabBarPage] = [.searchFlow, .favoriteFlow, .responseFlow, .massageFlow, .profileFlow]
//	static let firstPage: TabBarPage = .searchFlow
}
