//
//  WeatherSummaryView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct WeatherSummaryView: View {

    @Environment(Theme.self) private var theme

    var item: Weather?

    var body: some View {
        if let weatherItem = item {

            VStack(alignment: .leading, spacing: -theme.spacing.md) {
                Text(weatherItem.avgTempLevel)
                    .font(theme.fonts.subtitle1)

                HStack(alignment: .lastTextBaseline) {
                    HStack(spacing: 0) {
                        Text(weatherItem.avgTemp)
                            .font(theme.fonts.h3Headline)
                        Image(systemName: weatherItem.icon)
                            .font(theme.fonts.h4Headline)
                    }

                    Spacer()
                    VStack(alignment: .trailing, spacing: theme.spacing.xs) {
                        Text(weatherItem.condition)
                            .font(theme.fonts.subtitle1)

                        Text(weatherItem.displayActualTemp)
                            .font(theme.fonts.subtitle2)
                    }

                }

                Text(weatherItem.displayTempRange)
                    .font(theme.fonts.subtitle1)
            }

        }
    }
}

#Preview {
    WeatherSummaryView(item: .previewItem)
        .environment(Theme())
}
