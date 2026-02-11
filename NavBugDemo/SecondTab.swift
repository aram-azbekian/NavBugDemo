//
//  SecondTab.swift
//  NavBugDemo
//
//  Created by aram.azbekyan on 05.02.2026.
//

import SwiftUI
import Combine

struct SecondTab: View {
	@EnvironmentObject private var tabViewVM: TabViewViewModel
	@State private var path: [String] = []

	var body: some View {
		NavigationStack(path: $path) {
			Text("Second Tab")
				.onChange(of: tabViewVM.needToGoToWeather, perform: { _ in
					path.append("weather")
				})
				.navigationTitle("Second")
				.navigationDestination(for: String.self) { _ in
					Label("Weather", systemImage: "sun.max")
				}
		}
	}
}
