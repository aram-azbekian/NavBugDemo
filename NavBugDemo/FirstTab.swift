//
//  FirstTab.swift
//  NavBugDemo
//
//  Created by aram.azbekyan on 05.02.2026.
//

import SwiftUI
import Combine

struct FirstTab: View {
	@EnvironmentObject private var tabViewVM: TabViewViewModel
	var body: some View {
		Button("Go Weather") {
			let state = NavigationState(selectedTab: 1, secondTabPath: ["weather"])
			tabViewVM.navState = state
		}
	}
}
