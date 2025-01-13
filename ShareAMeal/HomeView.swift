//
//  HomeView.swift
//  ShareAMeal
//
//  Created by Eric on 13/01/2025.
//

import SwiftUI

struct HomeView: View {
    @Environment(DataController.self) var dataController
    var foodbank: Foodbank

    var body: some View {
        NavigationStack {
            List {
                Section("\(foodbank.name) foodbank needs...") {
                    ForEach(foodbank.neededItems, id: \.self) { item in
                        Text(item)
                    }
                }
            }
            .navigationTitle("Share a Meal")
            .toolbar {
                Button("Change Location") {
                    withAnimation {
                        dataController.select(nil)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(foodbank: .example)
        .environment(DataController())
}
