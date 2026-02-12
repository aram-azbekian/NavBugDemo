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

	var body: some View {
		NavigationStack(path: Binding(get: { tabViewVM.navState.secondTabPath }, set: { tabViewVM.navState.secondTabPath = $0 })) {
			Text("Second Tab")
				.navigationTitle("Second")
				.navigationDestination(for: String.self) { _ in
					Label("Weather", systemImage: "sun.max")
				}
		}
	}
}
