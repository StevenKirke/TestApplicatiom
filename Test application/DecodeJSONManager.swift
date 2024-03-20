//
//  DecodeJSONManager.swift
//  Test application
//
//  Created by Steven Kirke on 16.03.2024.
//

import Foundation

enum DecodeError: LocalizedError {
	case errorDecodeJson(String)
	case errorEncodeJson(String)
}

protocol IDecodeJsonManager {
	/**
	 Метод для декодирования Data в модель.
	 - Parameters:
			- data: Данные в формате Data.
			- model: Модель для декодирования, структура подписанная на Decodable.
	 - Throws: Возвращает ошибку, формата``DecodeError.errorDecodeJson``.
	 - Returns: Возвращает Result, модель или ошибку.
	 */
	func decodeJSON<T: Decodable>(data: Data, model: T.Type, returnJSON: @escaping (Result<T, DecodeError>) -> Void)
}

final class DecodeJsonManager: IDecodeJsonManager {
	func decodeJSON<T: Decodable>(data: Data, model: T.Type, returnJSON: @escaping (Result<T, DecodeError>) -> Void) {
		DispatchQueue.main.async {
			do {
				let json = try JSONDecoder().decode(T.self, from: data)
				return returnJSON(.success(json))
			} catch let error {
				return returnJSON(.failure(.errorDecodeJson(error.localizedDescription)))
			}
		}
	}
}
