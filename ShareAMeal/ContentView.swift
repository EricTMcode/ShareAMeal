//
//  ContentView.swift
//  ShareAMeal
//
//  Created by Eric on 10/01/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(DataController.self) var dataController

    var body: some View {
        if let selectedFoodbank = dataController.selectedFoodbank {
            TabView {
                HomeView(foodbank: selectedFoodbank)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                Text("My Foodbank")
                    .tabItem {
                        Label("My Foodbank", systemImage: "building.2")
                    }

                Text("Drop-off Points")
                    .tabItem {
                        Label("Drop-off Points", systemImage: "basket")
                    }
            }
        } else {
            EnterLocationView()
        }
    }
}

#Preview {
    ContentView()
        .environment(DataController())
}
