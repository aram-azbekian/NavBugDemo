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
		TabView(selection: $viewModel.selectedTab) {
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

final class TabViewViewModel: ObservableObject {
	@Published var selectedTab: Int = 0
	@Published var needToGoToWeather: Bool = false
}
