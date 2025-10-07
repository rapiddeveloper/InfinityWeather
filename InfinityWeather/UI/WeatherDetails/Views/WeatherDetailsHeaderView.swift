//
//  WeatherDetailsHeaderView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct WeatherDetailsHeaderView: View {
     
    @Environment(Theme.self) private var theme
    var weather: LocationWeather
    
    var body: some View {
             VStack {
                Text(weather.city)
                    .font(.largeTitle)
                Text(weather.avgTemp)
                    .font(.system(size: 96, weight: .medium, design: .rounded))
                Text(weather.condition)
                    .font(.headline)
                Text(weather.displayTempRange)
                    .font(.title3)
            }
            .weatherHeaderStyle()
    }
}
