//
//  WeatherStore.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI
import Foundation

@Observable
class WeatherStore {
    
    private(set) var weather: Weather?
    
    func setWeather(_ newValue: Weather?)  {
        weather = newValue
    }
}
