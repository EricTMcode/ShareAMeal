//
//  ShareAMealApp.swift
//  ShareAMeal
//
//  Created by Eric on 10/01/2025.
//

import SwiftUI

@main
struct ShareAMealApp: App {
    @State private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(dataController)
        }
    }
}
