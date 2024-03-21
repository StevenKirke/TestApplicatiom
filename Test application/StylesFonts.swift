//
//  StylesFonts.swift
//  Test application
//
//  Created by Steven Kirke on 21.03.2024.
//

import SwiftUI

enum FontStyle {
	case titleOne
	case titleTwo
	case titleThree
	case titleFour
	case textOne
	case buttonTextOne
	case buttonTextTwo
	case tabText
}

extension Text {
	func customFont(style: FontStyle) -> some View {
		switch style {
		case .titleOne:
			self
				.font(.system(size: 22, weight: .semibold))
		case .titleTwo:
			self
				.font(.system(size: 20, weight: .semibold))
		case .titleThree:
			self
				.font(.system(size: 16, weight: .medium))
		case .titleFour:
			self
				.font(.system(size: 14, weight: .medium))
		case .textOne:
			self
				.font(.system(size: 14, weight: .regular))
		case .buttonTextOne:
			self
				.font(.system(size: 16, weight: .semibold))
		case .buttonTextTwo:
			self
				.font(.system(size: 14, weight: .regular))
		case .tabText:
			self
				.font(.system(size: 10, weight: .regular))
		}
	}
}
