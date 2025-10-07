//
//  WeatherAttribute.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
/*
 Abstract:  This struct defines all the data a weather card needs,
 using an enum to handle the two different layouts shown in your image.
 */


import Foundation

typealias AttributeDetails = [(label: String, value: String)]
 
struct WeatherAttribute: Identifiable {
    let id = UUID()
    let systemImage: String // e.g., "thermometer.sun.fill", "wind"
    let title: String    // e.g., "FEELS LIKE", "Wind"
    let style: ContentStyle
    
    enum ContentStyle {
        // Case 1: Used for "Feels Like" (large value, small description, optional list below)
        case singleValue(
            value: String, 
            description: String = "",
            details: AttributeDetails? = nil,
            detailsLabel: String? = nil
        )
        // Case 2: Used for "Wind" (simple multi-line attribute list)
        case list(attributes: AttributeDetails)
    }
}

extension WeatherAttribute.ContentStyle {
    var isList: Bool {
        switch self {
        case .singleValue: return false
        case .list: return true
        }
    }
}
