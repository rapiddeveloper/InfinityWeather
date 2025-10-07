//
//  HomeViewModel.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
/*
 Abstract: Searches for available weather information for cities that match the specified city
 */

import SwiftUI

@Observable
class HomeViewModel {
    
    var city: String = ""
    var weather: Weather?
    var weatherService: WeatherService
    var searchResults: [LocationCoordinates] = []
    
 
    init(weather: Weather? = nil, weatherService: WeatherService = .shared) {
        self.weatherService = weatherService
        self.weather = weather

    }
    
    
    @MainActor
    func findMatchingCities() async throws {
 
         let result =  await weatherService.getMatchingCities(forQuery: city)
 
        do {
            searchResults = try result.get()
        } catch {
            print("Request Error: \(error)")
            throw RequestError.unexpected(error.localizedDescription)
        }
    }
}
