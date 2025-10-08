//
//  WeatherStore.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI
import Foundation

@Observable
class WeatherDetailsViewModel {
    
    private(set) var weather: LocationWeather?
    private let weatherService: WeatherServiceProtocol
    
    init(weather: LocationWeather? = nil, weatherService: WeatherServiceProtocol = WeatherService()) {
        self.weather = weather
        self.weatherService = weatherService
     }
    
    func setWeather(_ newValue: LocationWeather?)  {
        weather = newValue
    }
    
    func loadWeather(forLocation location: LocationCoordinate) async throws {
      let result = await weatherService.getCurrentWeather(forLocation: location)
        do {
            weather = try result.get()
        } catch {
            throw RequestError.unexpected(error.localizedDescription)
        }
    }
}
