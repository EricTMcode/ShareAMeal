//
//  Foodbank.swift
//  ShareAMeal
//
//  Created by Eric on 10/01/2025.
//

import Foundation

struct Foodbank: Codable, Identifiable {
    var id: String { slug }
    var slug: String
    var name: String
    var phone: String
    var email: String
    var address: String
}
