//
//  PreviewData.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

extension Weather {
    
    static let previewItem: Weather = .init(
        displayTempRange: "High: 84° - Low 75°",
        icon: "cloud.fill",
        displayActualTemp: "Feels Like 78°",
        avgTemp: "81°",
        condition: "Cloudy", avgTempLevel: "Low")
    //static let previewData = [
}

extension WeatherAttribute {
    static let previewSingleValue: WeatherAttribute = .init(
        systemImage: "cloud.fill",
        title: "Feels Lide", style: .singleValue(value: "+29°C", description: "above average daily high average daily high", details: [(label: "Today", value: "H:29°C"), (label: "Average", value: "H:30°C")])
    )
    
    static let previewSingleValueNoSubheadline: WeatherAttribute = .init(
        systemImage: "cloud.fill",
        title: "Feels Lide", style: .singleValue(value: "+29°C", details: [(label: "Today", value: "H:29°C"), (label: "Average", value: "H:30°C")])
    )
    
    static let previewSingleValueNoSubheadlineSingleDetail: WeatherAttribute = .init(
        systemImage: "cloud.fill",
        title: "Feels Lide", style: .singleValue(value: "+29°C", detailsLabel: "Similar to the actual temperature")
    )
    
    
    static let previewList: WeatherAttribute = .init(
        systemImage: "cloud.fill",
        title: "Feels Lide",
        style: .list(attributes:  [(label: "Wind", value: "8 mph"),
                                   (label: "Gusts", value: "13 mph"),
                                   (label: "Direction", value: "220 SW")
                                  ])
    )
    
    
}
