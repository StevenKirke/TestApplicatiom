//
//  LoginView.swift
//  Test application
//
//  Created by Steven Kirke on 15.03.2024.
//

import SwiftUI

struct LoginView: View {
	@EnvironmentObject var globalModel: GlobalFavoritesModel
	@State var textFiled: String = "Test@gmail.com"
	@State var isLoginView: Bool = false

	var body: some View {
		NavigationStack {
			ZStack {
				Color(hex: "0C0C0C")
					.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
				VStack(spacing: 18) {
					CardSearchWork(textFiled: $textFiled, isLoginView: $isLoginView)
					CardSearchPerson()
				}
				.padding(.horizontal, 17)
			}
			.navigationDestination(isPresented: $isLoginView) {
				PasswordView(eMail: textFiled).environmentObject(globalModel)
			}
		}
	}
}

private struct CardSearchWork: View {

	let eMailValidationService = EMailValidationService()

	@Binding var textFiled: String
	@Binding  var isLoginView: Bool
	@State private var isValidEmail: Bool = false {
		didSet {
			if isValidEmail {
				isShowAlertLabel = false
			} else {
				isShowAlertLabel = true
			}
		}
	}
	@State private var isShowAlertLabel: Bool = false

	var body: some View {
		VStack(spacing: 16) {
			Text("Поиск работы")
				.font(.system(size: 16, weight: .medium))
				.foregroundColor(.white)
				.frame(maxWidth: .infinity, alignment: .leading)
			VStack(spacing: 8) {
				TextFieldEmail(textFiled: $textFiled, isShowAlertLabel: $isShowAlertLabel)
				if isShowAlertLabel {
					Text("Вы ввели неверный e-mail")
						.foregroundColor(Color(hex: "FF0000"))
						.font(.system(size: 13, weight: .regular))
						.frame(maxWidth: .infinity, alignment: .leading)
				}
			}
			GeometryReader { proxy in
				let width = proxy.size.width / 2
				HStack(spacing: 0) {
					Button(
						action: {
							validEmail()
							nextView()
						},
						label: {
							Text("Продолжить")
								.font(.system(size: 14, weight: .regular))
								.foregroundColor(.white)
								.frame(maxWidth: width, maxHeight: 40)
								.background(textFiled.isEmpty ? Color(hex: "00427D") : Color(hex: "2B7EFE"))
								.cornerRadius(8)
						}
					)
					.disabled(textFiled.isEmpty)
					Spacer()
					Button(
						action: {
						},
						label: {
							Text("Войти с паролем")
								.font(.system(size: 14, weight: .regular))
								.foregroundColor(Color(hex: "2B7EFE"))
						}
					)
				}
			}
			.frame(maxWidth: .infinity, maxHeight: 40)
		}
		.padding(.vertical, 35)
		.padding(.horizontal, 16)
		.background(Color(hex: "222325"))
		.cornerRadius(8.0)
		.shadow(color: .black.opacity(0.25), radius: 4, x: 0.0, y: 4.0)
	}

	private func validEmail() {
		DispatchQueue.main.async {
			withAnimation(.easeInOut) {
				isValidEmail = eMailValidationService.validationEmail(email: textFiled)
			}
		}
	}

	private func nextView() {
		DispatchQueue.main.async {
			if !textFiled.isEmpty && isValidEmail {
				isLoginView.toggle()
			}
		}
	}
}

private struct TextFieldEmail: View {

	@State var isShowPlaceholder: Bool = true
	@Binding var textFiled: String
	@Binding var isShowAlertLabel: Bool

	var body: some View {
		ZStack(alignment: .leading) {
			if isShowPlaceholder || textFiled.isEmpty {
				HStack(spacing: 8) {
					Button(
						action: { },
						label: {
							Image("Images/Icons/iconResponse")
								.resizable()
								.scaledToFit()
								.frame(width: 24, height: 24)
						}
					)
					Text("Электронная почта или телефон")
						.font(.system(size: 14, weight: .regular))
				}
				.foregroundColor(Color(hex: "9F9F9F"))
				.padding(.leading, 8)
			}
			if !textFiled.isEmpty {
				Button(
					action: {
						textFiled = ""
						hideAlertLabel()
					},
					label: {
						Image(systemName: "multiply")
							.font(.system(size: 20))
							.foregroundColor(Color(hex: "DBDBDB"))
							.padding(.trailing, 16)
					}
				)
				.frame(maxWidth: .infinity, alignment: .trailing)
				.zIndex(10)
			}
				TextField("", text: $textFiled)
					.font(.system(size: 14, weight: .regular))
					.foregroundColor(.white)
					.onTapGesture {
						isShowPlaceholder = false
					}
					.padding(.leading, 8)
					.padding(.trailing, 20)
					.onChange(of: textFiled) { _ in
						hideAlertLabel()
					}

		}
		.frame(maxWidth: .infinity, maxHeight: 40)
		.background(Color(hex: "313234"))
		.cornerRadius(8.0)
		.overlay(
			   RoundedRectangle(cornerRadius: 8)
				.stroke(isShowAlertLabel ? Color(hex: "FF0000") : Color(hex: "313234"), lineWidth: 2)
		   )
		.shadow(color: .black.opacity(0.25), radius: 4, x: 0.0, y: 4.0)
	}

	private func hideAlertLabel() {
		DispatchQueue.main.async {
			withAnimation(.easeInOut) {
				isShowAlertLabel = false
			}
		}
	}
}

private struct CardSearchPerson: View {

	var body: some View {
		VStack(spacing: 16) {
			VStack(spacing: 8) {
				Text("Поиск сотрудников")
					.font(.system(size: 16, weight: .medium))
					.foregroundColor(.white)
					.frame(maxWidth: .infinity, alignment: .leading)
				Text("Размещение вакансий и доступ к базе резюме")
					.font(.system(size: 14, weight: .regular))
					.foregroundColor(.white)
					.frame(maxWidth: .infinity, alignment: .leading)
			}
			Button(
				action: {},
				label: {
					Text("Продолжить")
						.font(.system(size: 14, weight: .regular))
						.foregroundColor(.white)
						.frame(maxWidth: .infinity, maxHeight: 40)
						.background(Color(hex: "4CB24E"))
						.cornerRadius(8)
				}
			)
		}
		.padding(.vertical, 35)
		.padding(.horizontal, 16)
		.background(Color(hex: "222325"))
		.cornerRadius(8.0)
		.shadow(color: .black.opacity(0.25), radius: 4, x: 0.0, y: 4.0)
	}
}

//#if DEBUG
//struct LoginView_Previews: PreviewProvider {
//	static var previews: some View {
//		ContentView()
//	}
//}
//#endif
