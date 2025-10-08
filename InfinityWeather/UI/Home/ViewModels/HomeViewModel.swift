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
     var weatherService: WeatherService
    var searchResults: [LocationCoordinate] = []
    
 
    init(weatherService: WeatherService = WeatherService()) {
        self.weatherService = weatherService
        print("creating home model")
    }
    
    
    @MainActor
    func findMatchingCities() async throws {
 
         let result =  await weatherService.getMatchingCities(forQuery: city)
 
        do {
            searchResults = try result.get()
        } catch {
             throw RequestError.unexpected(error.localizedDescription)
        }
    }
    
    func updateSearchCity(_ newCity: String) {
        city = newCity
    }
}
