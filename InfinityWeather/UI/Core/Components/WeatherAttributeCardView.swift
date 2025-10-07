//
//  WeatherCard.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct WeatherAttributeCardView: View {

    // We keep the Theme dependency for consistency, though it's not strictly necessary
    // for this specific refactor's logic.
    @Environment(Theme.self) private var theme

    let attribute: WeatherAttribute

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.sm) {
            // 1. Always render the Header at the top
            Label {
                Text(attribute.title)
                    .font(.subheadline)
                    .fontWeight(.medium)
            } icon: {
                Image(systemName: attribute.systemImage)
            }

            // 2. Render the body content based on the enum case

            switch attribute.style {
            case .singleValue(
                let value, let description, let details, let detailsLabel):
                SingleValueContentView(
                    value: value, description: description, details: details,
                    detailsLabel: detailsLabel)

            case .list(let attributes):
                WeatherAttributeListContentView(attributes: attributes)
            }
        }

        .padding(.horizontal, theme.spacing.sm)
        .padding(.vertical, theme.spacing.md)
        .frame(maxWidth: attribute.style.isList ? .infinity : 180.0, alignment: .topLeading)
        .frame(height: 180.0)
        .background(theme.colors.surfaceContainerLowColor, in: RoundedRectangle(cornerRadius: 20))
       // .clipShape(RoundedRectangle(cornerRadius: 20))

        // Apply a subtle shadow to make it look like a floating card
        .shadow(color: Color.gray.opacity(0.1), radius: 5, x: 0, y: 3)
    }
}



#Preview(traits: .fixedLayout(width: 180, height: 180)) {

    WeatherAttributeCardView(attribute: .previewSingleValue)
        .environment(Theme())

}

#Preview(traits: .fixedLayout(width: 180, height: 180)) {

    WeatherAttributeCardView(attribute: .previewSingleValueNoSubheadline)
        .environment(Theme())

}

#Preview(traits: .fixedLayout(width: 180, height: 180)) {

    WeatherAttributeCardView(
        attribute: .previewSingleValueNoSubheadlineSingleDetail
    )
    .environment(Theme())

}

#Preview(traits: .sizeThatFitsLayout) {

    WeatherAttributeCardView(
        attribute: .previewList
    )
     .environment(Theme())

}

