//
//  SearchFilterView.swift
//  Test application
//
//  Created by Steven Kirke on 17.03.2024.
//

import SwiftUI

struct SearchFilterView: View {
	var body: some View {
		HStack(spacing: 7) {
			SearchView()
			FilterButton()
		}
	}
}

private struct SearchView: View {

	@State var textField: String = ""

	var body: some View {
		ZStack(alignment: .leading) {
			HStack(spacing: 12) {
				Image("Images/Icons/iconSearch")
					.foregroundColor(Color(hex: "9F9F9F"))
				Text("Должность, ключевые слова")
					.foregroundColor(Color(hex: "9F9F9F"))
					.font(.system(size: 14, weight: .regular))
					.shadow(color: .black, radius: 1)
			}
			.padding(.trailing, 19)
			TextField("", text: $textField)
				.font(.system(size: 14, weight: .regular))
				.foregroundColor(Color(hex: "9F9F9F"))
		}
		.padding(.leading, 12)
		.frame(maxHeight: 40)
		.background(Color(hex: "313234"))
		.cornerRadius(8.0)
	}
}

private struct FilterButton: View {
	var body: some View {
		Button(
			action: {},
			label: {
				Image(systemName: "slider.horizontal.3")
					.font(.system(size: 14))
					.foregroundColor(.white)
					.frame(width: 40, height: 40)
					.background(Color(hex: "313234"))
					.cornerRadius(10)
			}
		)
	}
}
