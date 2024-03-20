//
//  JobPageViewController.swift
//  Test application
//
//  Created by Steven Kirke on 17.03.2024.
//

import SwiftUI

struct JobPageViewController: View {

	@Environment(\.presentationMode) var returnMainVacancyViewController: Binding<PresentationMode>

	var body: some View {
		ZStack {
			Color(hex: "0C0C0C")
				.edgesIgnoringSafeArea(.all)
			VStack(spacing: 16) {
				ScrollView(.vertical, showsIndicators: false) {
					VStack(spacing: 24) {
						HeaderThreeButtons(returnMainVacancyViewController: returnMainVacancyViewController)
						HeaderJob()
						ButtonsJob()
						MapJob()
						DescriptionJob()
						TaskJob()
						QuestionBlockJob()
					}
				}
				ButtonWillResponse()
			}
			.padding(.horizontal, 16)
		}
		.navigationBarTitle("", displayMode: .inline)
		.navigationBarBackButtonHidden(true)
	}
}

private struct HeaderThreeButtons: View {

	var returnMainVacancyViewController: Binding<PresentationMode>

	var body: some View {
		HStack(spacing: 16) {
			Button(
				action: {
					backView()
				},
				label: {
					Image(systemName: "arrow.left")
						.font(.system(.title2))
				}
			)
			Spacer()
			Image(systemName: "eye")
				.font(.system(.title2))
			Image("Images/Icons/iconTreeCircle")
				.resizable()
				.scaledToFit()
				.frame(width: 24)
			Image(systemName: "heart")
				.font(.system(.title2))
		}
		.foregroundColor(.white)
	}

	private func backView() {
		DispatchQueue.main.async {
			self.returnMainVacancyViewController.wrappedValue.dismiss()
		}
	}
}

private struct HeaderJob: View {
	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			Text("UI/UX Designer")
				.font(.system(size: 22, weight: .semibold))
			Group {
				Text("Уровень дохода не указан")
				VStack(alignment: .leading, spacing: 6) {
					Text("Требуемый опыт: от 1 года до 3 лет")
					Text("Полная занятость, полный день")
				}
			}
			.foregroundColor(.white)
			.font(.system(size: 14, weight: .regular))
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.foregroundColor(.white)
	}
}

private struct ButtonsJob: View {
	var body: some View {
		HStack(spacing: 8) {
			ButtonJob(title: "147 человек уже откликнулись", image: "person")
			ButtonJob(title: "2 человека сейчас смотрят", image: "eye")
		}
	}
}

private struct ButtonJob: View {

	let title: String
	let image: String

	var body: some View {
		HStack(alignment: .top, spacing: 0) {
			Button(
				action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
				label: {
					Text(title)
						.foregroundColor(.white)
						.font(.system(size: 14, weight: .regular))
						.multilineTextAlignment(.leading)
				})
			Spacer()
			ZStack {
				Image(systemName: image)
					.resizable()
					.scaledToFit()
					.font(.system(.callout))
					.frame(width: 10, height: 10)
					.foregroundColor(.white)
			}
			.frame(width: 16, height: 16)
			.background(Color(hex: "4CB24E"))
			.clipShape(
				Circle()
			)
		}
		.padding(.horizontal, 8)
		.padding(.vertical, 8)
		.frame(maxWidth: .infinity, maxHeight: 50)
		.background(Color(hex: "015905"))
		.cornerRadius(8.0)
	}
}

private struct MapJob: View {
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack(spacing: 8) {
				Text("Мобирикс")
					.foregroundColor(.white)
					.font(.system(size: 16, weight: .medium))
				Image("Images/Icons/IconClock")
					.resizable()
					.scaledToFit()
					.frame(width: 12, height: 12)
					.foregroundColor(Color(hex: "858688"))
			}
			Image("Images/MockImage/map")
				.resizable()
				.scaledToFit()
			Text("Минск, улица Бирюзова, 4/5")
				.foregroundColor(.white)
				.font(.system(size: 14, weight: .regular))
		}
		.foregroundColor(Color.white)
		.padding(.vertical, 12)
		.padding(.horizontal)
		.background(Color(hex: "222325"))
		.cornerRadius(8.0)
	}
}

// swiftlint:disable all
private struct DescriptionJob: View {
	var body: some View {
		Text("MOBYRIX - динамично развивающаяся продуктовая IT-компания, специализирующаяся на разработке мобильных приложений для iOS и Android. Наша команда работает над собственными продуктами в разнообразных сферах: от утилит до развлечений и бизнес-приложений. Мы ценим талант и стремление к инновациям и в данный момент в поиске талантливого UX/UI Designer, готового присоединиться к нашей команде и внести значимый вклад в развитие наших проектов.")
			.foregroundColor(.white)
			.font(.system(size: 14, weight: .regular))
	}
}
// swiftlint:enable all

// swiftlint:disable all
private struct TaskJob: View {

	var textTest = "- Проектировать интерфейс B2B продукта: сопровождать и улучшать текущие решения, поддерживать консистентность\n\n- Понимать потребности и боли пользователей, логику взаимодействия пользователя с продуктом, участвовать в этапе discovery\n\n- Создавать интерактивные прототипы\n\n- Проводить юзабилити-тестирования и ревью реализации решений\n\n- Работать внутри продуктовой команды: коммуницировать с дизайнерами, продакт и проджект менеджерами, аналитиками, разработчиками и тестировщиками."

	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text("Ваши задачи")
				.font(.system(size: 20, weight: .semibold))
			Text(testRemone(text: textTest))
		}
		.foregroundColor(.white)
		.font(.system(size: 14, weight: .regular))
	}

	private func testRemone(text: String) -> String {
		let regex = try! NSRegularExpression(pattern: "(\n){2,}", options: NSRegularExpression.Options.caseInsensitive)
		let range = NSMakeRange(0, text.count)
		print(range)
		let modString = regex.stringByReplacingMatches(in: text, options: [], range: range, withTemplate: "\n")
		return modString
	}
}
// swiftlint:enable all

private struct QuestionBlockJob: View {
	private let tempQuestion: [String] = [
		"Где распологается место работы?",
		"Какой график работы?",
		"Вакансия открыта?",
		"Какая оплата труда?"
	]

	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Group {
				Text("Задайте вопрос работодателю")
					.foregroundColor(.white)
				Text("Он получит его с откликом на вакансию")
					.foregroundColor(Color(hex: "858688"))
					.padding(.bottom, 8)
			}
			.font(.system(size: 14, weight: .medium))
			.frame(maxWidth: .infinity, alignment: .leading)
				ForEach(tempQuestion, id: \.self) { question in
					ButtonQuestionJob(title: question)
						.foregroundColor(.white)
			}
		}
	}
}

private struct ButtonQuestionJob: View {

	let title: String

	var body: some View {
		Button(
			action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/,
			label: {
				Text(title)
					.font(.system(size: 14, weight: .medium))
					.padding(.vertical, 8)
					.padding(.horizontal, 12)
					.background(Color(hex: "313234"))
					.cornerRadius(33 / 2)
			}
		)
	}
}

private struct ButtonWillResponse: View {
	var body: some View {
		Button(
			action: {
			},
			label: {
				Text("Откликнутся")
					.font(.system(size: 14, weight: .regular))
					.foregroundColor(.white)
					.frame(maxWidth: .infinity)
					.frame(height: 48)
					.background(Color(hex: "2B7EFE"))
					.cornerRadius(8)
			}
		)

	}
}

#if DEBUG
struct JobPageScene_Previews: PreviewProvider {
	static var previews: some View {
		JobPageViewController()
	}
}
#endif
