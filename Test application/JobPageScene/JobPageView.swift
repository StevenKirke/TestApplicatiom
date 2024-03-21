//
//  JobPageViewController.swift
//  Test application
//
//  Created by Steven Kirke on 17.03.2024.
//

import SwiftUI

struct JobPageView: View {

	@ObservedObject var jobPageViewModel: JobPageViewModel
	var iterator: IJobPageIterator?

	var body: some View {
		ZStack {
			Color(hex: "0C0C0C")
				.edgesIgnoringSafeArea(.all)
			VStack(spacing: 16) {
				ScrollView(.vertical, showsIndicators: false) {
					VStack(spacing: 24) {
						if let model = jobPageViewModel.modelJob {
							HeaderThreeButtons(isFavorite: model.isFavorite, action: { backScene() })
							HeaderJob(viewModel: model)
							ButtonsJob(viewModel: model)
							MapJob(viewModel: model)
							if !model.description.isEmpty {
								DescriptionJob(descriptionCompany: model.description)
							}
							TaskJob(task: model.responsibilities)
							QuestionBlockJob(questions: model.questions)
						}
					}
				}
				.mask {
					RoundedRectangle(cornerRadius: 8.0)
				}
				ButtonWillResponse()
			}
			.padding(.horizontal)
			.padding(.bottom, 60)
		}
		.navigationBarTitle("", displayMode: .inline)
		.navigationBarBackButtonHidden(true)
	}

	private func backScene() {
		DispatchQueue.main.async {
			iterator?.backScene()
		}
	}
}

private struct HeaderThreeButtons: View {

	let isFavorite: Bool
	var action: () -> Void

	var body: some View {
		HStack(spacing: 16) {
			Button(
				action: action,
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
			Image(systemName: isFavorite ? "heart.fill" : "heart")
				.font(.system(.title2))
		}
		.foregroundColor(.white)
	}
}

private struct HeaderJob: View {

	let viewModel: JobPageModel.ViewModel.Vacancy

	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			Text(viewModel.title)
				.customFont(style: .titleOne)
			Group {
				Text(viewModel.salary)
				VStack(alignment: .leading, spacing: 6) {
					Text("\(viewModel.experience)")
						.customFont(style: .textOne)
					Text(viewModel.schedules)
						.customFont(style: .textOne)
				}
			}
			.foregroundColor(.white)
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.foregroundColor(.white)
	}
}

private struct ButtonsJob: View {

	let viewModel: JobPageModel.ViewModel.Vacancy

	var body: some View {
		HStack(spacing: 8) {
			if !viewModel.appliedNumber.isEmpty {
				ButtonJob(title: viewModel.appliedNumber, image: "person")
			}
			if !viewModel.lookingNumber.isEmpty {
				ButtonJob(title: viewModel.lookingNumber, image: "eye")
			}
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
						.customFont(style: .textOne)
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

	let viewModel: JobPageModel.ViewModel.Vacancy

	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			HStack(spacing: 8) {
				Text(viewModel.company)
					.foregroundColor(.white)
					.customFont(style: .titleThree)
				Image("Images/Icons/IconClock")
					.resizable()
					.scaledToFit()
					.frame(width: 12, height: 12)
					.foregroundColor(Color(hex: "858688"))
			}
			Image("Images/MockImage/map")
				.resizable()
				.scaledToFit()
			Text(viewModel.address)
				.foregroundColor(.white)
				.customFont(style: .textOne)
		}
		.foregroundColor(Color.white)
		.padding(.vertical, 12)
		.padding(.horizontal)
		.background(Color(hex: "222325"))
		.cornerRadius(8.0)
	}
}

private struct DescriptionJob: View {

	let descriptionCompany: String

	var body: some View {
		Text(descriptionCompany)
			.foregroundColor(.white)
			.customFont(style: .textOne)
			.frame(maxWidth: .infinity, alignment: .leading)
	}
}

private struct TaskJob: View {

	let task: String

	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text("Ваши задачи")
				.customFont(style: .titleTwo)
			Text(task)
				.customFont(style: .textOne)
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.foregroundColor(.white)
	}
}

private struct QuestionBlockJob: View {

	let questions: [String]

	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Group {
				Text("Задайте вопрос работодателю")
					.foregroundColor(.white)
					.customFont(style: .titleFour)
				Text("Он получит его с откликом на вакансию")
					.foregroundColor(Color(hex: "858688"))
					.customFont(style: .titleFour)
					.padding(.bottom, 8)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
				ForEach(questions, id: \.self) { question in
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
					.customFont(style: .titleFour)
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
					.customFont(style: .textOne)
					.foregroundColor(.white)
					.frame(maxWidth: .infinity)
					.frame(height: 48)
					.background(Color(hex: "2B7EFE"))
					.cornerRadius(8)
			}
		)

	}
}
