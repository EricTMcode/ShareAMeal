//
//  Foodbank.swift
//  ShareAMeal
//
//  Created by Eric on 10/01/2025.
//

import Foundation

struct Foodbank: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case name, slug, phone, email, address, distance = "distance_m", items = "needs"
    }

    var id: String { slug }
    var slug: String
    var name: String
    var phone: String
    var email: String
    var address: String
    var distance: Int
    var items: Items

    var distanceFormatted: String {
        let measurement = Measurement(value: Double(distance), unit: UnitLength.meters)

        let measurementString = measurement.formatted(.measurement(width: .wide))
        return "\(measurementString) from you"
    }

    var neededItems: [String] {
        let baseList = items.needs.components(separatedBy: .newlines)
        return Set(baseList).sorted()
    }
}

extension Foodbank {
    struct Items: Codable, Identifiable {
        var id: String
        var needs: String
        var excess: String?

        static let example = Items(id: "Example", needs: "Example Needed Item", excess: "Example Excess Item")
    }
}
