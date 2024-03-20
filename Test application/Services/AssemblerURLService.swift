//
//  AssemblerURLService.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import Foundation

protocol IAssemblerURLService: AnyObject {
	/// Сборщик Request.
	func assemblerVacancyList() -> URL?
}

final class AssemblerURLService: IAssemblerURLService {
	func assemblerVacancyList() -> URL? {
		var components = URLComponents()
		components.scheme = "https"
		components.host = "run.mocky.io"
		components.path = "/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14"
		components.queryItems = []
		return components.url
	}
}
