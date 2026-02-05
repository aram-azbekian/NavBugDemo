//
//  SecondTab.swift
//  NavBugDemo
//
//  Created by aram.azbekyan on 05.02.2026.
//

import SwiftUI
import Combine

struct SecondTab: View {
	@StateObject private var router = SecondTabRouter()
	@EnvironmentObject private var tabViewVM: TabViewViewModel
	var body: some View {
		NavigationStack(path: $router.path) {
			Text("Second Tab")
				.onChange(of: tabViewVM.needToGoToWeather, perform: { _ in
					router.path.append(.weather)
				})
				.navigationTitle("Second")

				.navigationDestination(for: SecondTabRoute.self) { route in
					SecondTabScreen(route: route)
				}
		}
		.environmentObject(router)
	}
}

final class SecondTabRouter: ObservableObject {
	@Published var path: [SecondTabRoute] = []
}
