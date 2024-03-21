//
//  MainProfileScene.swift
//  Test application
//
//  Created by Steven Kirke on 17.03.2024.
//

import SwiftUI


struct MainProfileView: View {

	var body: some View {
		ZStack {
			Color(hex: "0C0C0C")
				.edgesIgnoringSafeArea(.all)
			VStack(spacing: 0) {
				Button(
					action: {},
					label: {
						Text("Профиль")
							.foregroundColor(.white)
							.font(.system(size: 20, weight: .semibold))
					}
				)
			}
		}
	}
}
