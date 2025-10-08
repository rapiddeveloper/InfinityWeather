//
//  WeatherDetailsView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct WeatherDetailsView: View {

    @Environment(Theme.self) private var theme
    var weather: LocationWeather?
    var detailsStatus: RequestStatus

    var body: some View {

        InifinityScrollView {
            if let weather = weather, detailsStatus == .completed {
                Group {
                    WeatherDetailsHeaderView(weather: weather)


                    Grid(
                        alignment: .center, horizontalSpacing: theme.spacing.md,
                        verticalSpacing: theme.spacing.md
                    ) {
                        let dynamicallyGroupedData = groupWeatherCards(
                            weather.attributes)

                        // Loop through the array of rows we just created.
                        // Each inner array represents a single GridRow.
                        ForEach(dynamicallyGroupedData, id: \.first!.id) {
                            row in

                            GridRow {
                                // Loop through the cards in the current row.
                                ForEach(row) { card in

                                    WeatherAttributeCardView(attribute: card)
                                        .gridCellColumns(
                                            card.style.isList ? 2 : 1
                                        )
                                        .frame(maxWidth: .infinity)
                                    // If the row only has one card (and it's a single value card),
                                    // we let it take one column, leaving the other empty for now.
                                }
                            }
                        }

                    }
                    .padding(theme.spacing.containerPadding)

                    Spacer()

                }
                .ignoresSafeArea()


            }


            RequestStatusView(status: detailsStatus) {

            }

        }

    }
}

//extension WeatherDetailsView {
// Helper function to convert a flat array of cards into an array of rows.
func groupWeatherCards(_ data: [WeatherAttribute]) -> [[WeatherAttribute]] {
    var groupedRows: [[WeatherAttribute]] = []
    var singleValueQueue: [WeatherAttribute] = []  // Holds single-value cards waiting to be paired

    for attribute in data {
        if attribute.style.isList {
            // If we encounter a list card, first finish any pending pair.
            if !singleValueQueue.isEmpty {
                groupedRows.append(singleValueQueue)
                singleValueQueue = []
            }
            // Then, add the list card as its own full-width row.
            groupedRows.append([attribute])
        } else {  // singleValue card
            singleValueQueue.append(attribute)

            // Once we have two single-value cards, create a row and reset the queue.
            if singleValueQueue.count == 2 {
                groupedRows.append(singleValueQueue)
                singleValueQueue = []
            }
        }
    }

    // Handle any leftover single card (if the total count was odd)
    if !singleValueQueue.isEmpty {
        groupedRows.append(singleValueQueue)
    }

    return groupedRows
}
//}

#Preview {

    let store = WeatherStore()
    store.setWeather(.previewItem)

    // 1. Data for the three cards in the image
    let card1 = WeatherAttribute.previewSingleValue

    let card2 = WeatherAttribute.previewSingleValueNoSubheadline

    let card3 = WeatherAttribute.previewList
    let card4 = WeatherAttribute.previewHumidity
    let card5 = WeatherAttribute.previewHeat
    let card6 = WeatherAttribute.previewPressure
    let card7 = WeatherAttribute.previewUV

    // Combine all attributes into a single array
    let weatherData: [WeatherAttribute] = [
        card1, card2, card3, card4, card5, card6, card7,
    ]
    // let weatherData: [WeatherAttribute] = [card1, card2, card3, card4, card5]

    var tempWeather = LocationWeather.previewItem
    tempWeather.attributes = weatherData
    store.setWeather(tempWeather)

    return WeatherDetailsView(weather: store.weather, detailsStatus: .idle)
        .environment(store)
        .environment(Theme())
}
