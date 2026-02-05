//
//  SecondTabScreens.swift
//  NavBugDemo
//
//  Created by aram.azbekyan on 05.02.2026.
//

import SwiftUI

enum SecondTabRoute: Hashable {
	case messages
	case reminders
	case weather

	var title: String {
		switch self {
		case .messages:
			return "Messages"
		case .reminders:
			return "Reminders"
		case .weather:
			return "Weather"
		}
	}

	var systemImage: String {
		switch self {
		case .messages:
			return "message"
		case .reminders:
			return "note"
		case .weather:
			return "cloud"
		}
	}

	var nextRoute: SecondTabRoute? {
		switch self {
		case .messages:
			return .reminders
		case .reminders:
			return .weather
		case .weather:
			return nil
		}
	}
}

struct SecondTabScreen: View {
	@EnvironmentObject private var router: SecondTabRouter

	let route: SecondTabRoute

	var body: some View {
		VStack {
			Label(route.title, systemImage: route.systemImage)
			Button("Maybe Go Next") {
				if let nextRoute = route.nextRoute {
					router.path.append(nextRoute)
				}
			}
		}
		.navigationTitle(route.title)
	}
}
