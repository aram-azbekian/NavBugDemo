//
//  ContentView.swift
//  NavBugDemo
//
//  Created by aram.azbekyan on 05.02.2026.
//

import SwiftUI
import Combine

struct ContentView: View {
	@StateObject private var viewModel = TabViewViewModel()
    var body: some View {
//		TabView(selection: $viewModel.selectedTab) {
		TabView(selection: Binding(get: { viewModel.navState.selectedTab }, set: { viewModel.navState.selectedTab = $0 })) {
			FirstTab()
				.tabItem {
					Text("First")
				}
				.tag(0)

			SecondTab()
				.tabItem {
					Text("Second")
				}
				.tag(1)
		}
		.environmentObject(viewModel)
    }
}

struct NavigationState {
	var selectedTab: Int
	var secondTabPath: [String]
}

final class TabViewViewModel: ObservableObject {
//	@Published var selectedTab: Int = 0
	@Published var navState: NavigationState = .init(selectedTab: 0, secondTabPath: [])
//	@Published var needToGoToWeather: Bool = false
}
