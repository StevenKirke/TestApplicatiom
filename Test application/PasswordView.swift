//
//  PasswordView.swift
//  Test application
//
//  Created by Steven Kirke on 15.03.2024.
//

import SwiftUI

enum NamePasswordFields: Int, CaseIterable {
	case first
	case second
	case third
	case fourth
}

struct PasswordView: View {

	@EnvironmentObject var globalModel: GlobalFavoritesModel
	@FocusState private var focus: NamePasswordFields?
	@State var isPasswordView: Bool = false
	@State private var passwords: [String] = ["", "", "", ""]
	@State private var isBlockButton: Bool = true
	var eMail: String

	var body: some View {
		NavigationStack {
			ZStack {
				Color(hex: "0C0C0C")
				VStack(alignment: .leading, spacing: 15) {
					Text("Отправили код на \(eMail)")
						.font(.system(size: 20, weight: .semibold))
						.tint(Color.white)
						.foregroundColor(.white)
					Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
						.font(.system(size: 16, weight: .medium))
						.foregroundColor(.white)
					HStack(spacing: 8) {
						ForEach(NamePasswordFields.allCases, id: \.self) { element in
							PasswordField(
								textField: $passwords[element.rawValue],
								focus: $focus,
								currentField: element
							)
						}
					}
					.onChange(of: passwords) { _ in
						for element in NamePasswordFields.allCases {
							if passwords[element.rawValue].isEmpty {
								focus = element
								break
							} else {
								focus = nil
							}
						}
						if passwords.allSatisfy({ !$0.isEmpty }) {
							isBlockButton = false
						}
					}
					Button(
						action: {
							globalModel.isAutorized = true
							isPasswordView.toggle()
						},
						label: {
							Text("Подтвердить")
								.font(.system(size: 14, weight: .regular))
								.foregroundColor(.white)
								.frame(maxWidth: .infinity, maxHeight: 48)
								.background(isBlockButton ? Color(hex: "00427D") : Color(hex: "2B7EFE"))
								.cornerRadius(8.0)
						}
					)
					.disabled(isBlockButton)
				}
				.padding(.horizontal, 16)
				.onAppear {
					focus = .first
				}
			}
			.edgesIgnoringSafeArea(.all)
			.navigationBarTitle("", displayMode: .inline)
			.navigationBarBackButtonHidden(true)
			.navigationDestination(isPresented: $isPasswordView) {
				//MainSearchView(mainSearchViewModel: MainSearchViewModel()).environmentObject(globalModel)
			}
		}
	}
}

private struct PasswordField: View {

	@Binding var textField: String
	@FocusState.Binding var focus: NamePasswordFields?
	var currentField: NamePasswordFields

	var body: some View {
		ZStack {
			if focus != currentField && textField.isEmpty {
				Image(systemName: "staroflife.fill")
					.font(.system(size: 12, weight: .light))
					.foregroundColor(Color(hex: "858688"))
			}
			SecureField("", text: $textField)
				.focused($focus, equals: currentField)
				.font(.system(size: 24, weight: .medium))
				.foregroundColor(Color(hex: "858688"))
				.multilineTextAlignment(.center)
				.keyboardType(.decimalPad)
				.tint(.white)
				.onChange(of: textField) {
					if let number = Int($0) {
						textField = String($0.prefix(1))
					} else {
						textField = ""
					}
				}
		}
		.frame(maxWidth: 48, maxHeight: 48)
		.background(Color(hex: "313234"))
		.cornerRadius(8.0)
	}
}

#if DEBUG
struct PasswordView_Previews: PreviewProvider {
	static var previews: some View {
		PasswordView(eMail: "")
	}
}
#endif
