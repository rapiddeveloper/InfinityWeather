//
//  WeatherResult.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

struct Weather {
    
    var displayTempRange: String
    var icon: String
    var displayActualTemp: String
    var avgTemp: String
    var condition: String
    var avgTempLevel: String
    var city: String
    
    var attributes: [WeatherAttribute] = []
}
