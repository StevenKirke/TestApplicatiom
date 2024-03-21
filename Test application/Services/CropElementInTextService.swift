//
//  CropElementInTextService.swift
//  Test application
//
//  Created by Steven Kirke on 20.03.2024.
//

import Foundation

protocol IRemoveElementInTextService: AnyObject {
	func removeExtraCharacter(text: String) -> String
}

final class RemoveElementInTextService: IRemoveElementInTextService {
	func removeExtraCharacter(text: String) -> String {
		removeExtraSymbol(text)
	}
}

private extension IRemoveElementInTextService {
	func removeExtraSymbol(_ text: String) -> String {
		var currentText = ""
		do {
			let regex = try NSRegularExpression(pattern: "(\n){2,}", options: NSRegularExpression.Options.caseInsensitive)
			let range = NSRange(location: 0, length: text.count)
			currentText = regex.stringByReplacingMatches(in: text, options: [], range: range, withTemplate: "\n")
		} catch let error {
			print("Error: failure regex symbols! \(error)")
		}
		return currentText
	}
}
