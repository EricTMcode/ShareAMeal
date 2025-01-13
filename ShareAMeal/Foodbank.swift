//
//  Foodbank.swift
//  ShareAMeal
//
//  Created by Eric on 10/01/2025.
//

import CoreLocation
import Foundation

struct Foodbank: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case slug, name, phone, email, address, distance = "distance_m", location = "lat_lng", items = "needs", alternativeItems = "need", locations
    }

    var id: String { slug }
    var name: String
    var slug: String
    var phone: String
    var email: String
    var address: String
    var distance: Int?
    var location: String
    var items: Items?
    var alternativeItems: Items?
    var locations: [Location]?

    var distanceFormatted: String {
        guard let distance else { return "Unknown distance from you" }

        let measurement = Measurement(value: Double(distance), unit: UnitLength.meters)

        let measurementString = measurement.formatted(.measurement(width: .wide))
        return "\(measurementString) from you"
    }

    var actualItems: Items {
        items ?? alternativeItems ?? Items(id: "None", needs: "None")
    }

    var neededItems: [String] {
        let baseList = actualItems.needs.components(separatedBy: .newlines)
        return Set(baseList).sorted()
    }

    var coodinate: CLLocationCoordinate2D? {
        let components = location.split(separator: ",").compactMap(Double.init)
        guard components.count == 2 else { return nil }

        return CLLocationCoordinate2D(latitude: components[0], longitude: components[1])
    }

    static let example = Foodbank(name: "Example Name", slug: "Example Slug", phone: "Phone", email: "Email", address: "Address", distance: 1000, location: "0,0", items: .example)
}

extension Foodbank {
    struct Items: Codable, Identifiable {
        var id: String
        var needs: String
        var excess: String?

        static let example = Items(id: "Example", needs: "Example Needed Item", excess: "Example Excess Item")
    }
}

struct Location: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case name, slug, address, location = "lat_lng"
    }

    var id: String { slug }
    var name: String
    var slug: String
    var address: String
    var location: String

    var coodinate: CLLocationCoordinate2D? {
        let components = location.split(separator: ",").compactMap(Double.init)
        guard components.count == 2 else { return nil }

        return CLLocationCoordinate2D(latitude: components[0], longitude: components[1])
    }
}
