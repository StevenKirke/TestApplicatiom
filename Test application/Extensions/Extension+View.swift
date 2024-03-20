//
//  Extension+View.swift
//  Test application
//
//  Created by Steven Kirke on 14.03.2024.
//

import UIKit

final class GetSaveAreaInset {
	static func getSaveAreaInset() -> CGFloat {
		if let window = UIApplication.shared.windows.first {
			let bottom = window.safeAreaInsets.bottom
			return bottom
		}
		return .zero
	}
}
