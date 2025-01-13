//
//  DropOffView.swift
//  ShareAMeal
//
//  Created by Eric on 13/01/2025.
//

import MapKit
import SwiftUI

struct DropOffView: View {
    var foodbank: Foodbank

    var body: some View {
        NavigationStack {
            Map {
                if let coordinate = foodbank.coodinate {
                    Marker("Your foodbank", coordinate: coordinate)
                }

                if let locations = foodbank.locations {
                    ForEach(locations) { location in
                        if let coordinate = location.coodinate {
                            Marker(location.name, coordinate: coordinate)
                        }
                    }
                }
            }
            .navigationTitle("Drop-off Points")
        }
    }
}

#Preview {
    DropOffView(foodbank: .example)
}
