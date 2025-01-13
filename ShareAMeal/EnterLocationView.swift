//
//  EnterLocationView.swift
//  ShareAMeal
//
//  Created by Eric on 10/01/2025.
//

import SwiftUI

struct EnterLocationView: View {
    @State private var postCode = "SW11AA"

    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome")
                    .font(.largeTitle)

                Text("To get started, please tell us your postcode.")

                HStack {
                    TextField("Your post code", text: $postCode)
                        .textFieldStyle(.roundedBorder)
                        .frame(maxWidth: 200)

                    NavigationLink("Go") {
                        SelectFoodbankView(postCode: postCode)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    EnterLocationView()
}
