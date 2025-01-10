//
//  DataController.swift
//  ShareAMeal
//
//  Created by Eric on 10/01/2025.
//

import Foundation

enum LoadState {
    case loading, failed, loaded([Foodbank])
}

@Observable
class DataController {
    func loadFoodbanks(near postcode: String) async -> LoadState {
        let fullURL = "https://www.givefood.org.uk/api/2/foodbanks/search/?address=\(postCode)"

        guard let url = URL(string: fullURL) else {
            return .
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let foodbanks = try JSONDecoder().decode([Foodbank].self, from: data)
            return .loaded(foodbanks)
        } catch {
            return .failed
        }
    }
}
