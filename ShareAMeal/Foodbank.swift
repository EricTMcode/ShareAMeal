//
//  Foodbank.swift
//  ShareAMeal
//
//  Created by Eric on 10/01/2025.
//

import Foundation

struct Foodbank: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case name, slug, phone, email, address, distance = "distance_m"
    }

    var id: String { slug }
    var slug: String
    var name: String
    var phone: String
    var email: String
    var address: String
    var distance: Int

    var distanceFormatted: String {
        let measurement = Measurement(value: Double(distance), unit: UnitLength.meters)

        let measurementString = measurement.formatted(.measurement(width: .wide))
        return "\(measurementString) from you"
    }


}
