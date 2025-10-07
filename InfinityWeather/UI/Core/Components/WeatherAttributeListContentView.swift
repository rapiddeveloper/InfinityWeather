//
//  WeatherAttributeListContentView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct WeatherAttributeListContentView: View {

    @Environment(Theme.self) private var theme
    var attributes: AttributeDetails

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.lg) {
            ForEach(attributes, id: \.label) { attr in
                HStack {
                    // Left Label (e.g., Wind, Gusts, Direction)
                    Text(attr.label)
                        .font(.subheadline)

                    Spacer()

                    // Right Value (e.g., 8 mph, 13 mph, 220 SW)
                    Text(attr.value)
                        .font(.subheadline.weight(.medium))
                }
            }
        }
        .padding(.top, theme.spacing.sm)
    }
}
