//
//  SelectFoodbankView.swift
//  ShareAMeal
//
//  Created by Eric on 10/01/2025.
//

import SwiftUI

struct SelectFoodbankView: View {
    @Environment(DataController.self) private var dataController
    @State private var state = LoadState.loading

    var postCode: String

    var body: some View {
        Group {
            switch state {
            case .loading:
                ProgressView("Loading...")

            case .failed:
                Text("Oops")

            case .loaded(let foodbanks):
                Text("Found \(foodbanks.count) food banks")
            }
        }
        .navigationTitle("Nearby Foodbanks")
        .task { fetchFoodbanks() }
    }

    func fetchFoodbanks() {
        state = .loading

        Task {
            try await Task.sleep(for: .seconds(0.5))

            state = await dataController.loadFoodbanks(near: postCode)
        }
    }
}

#Preview {
    SelectFoodbankView(postCode: "SW1 1AA")
        .environment(DataController())
}
