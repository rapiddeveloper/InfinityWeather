//
//  WeatherService.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
/*
 Abstract: Sends and retrives weather related raw data to and from the API. It also transforms API Model responses to domain models
 consumed in the UI layer
 */

import Foundation

protocol WeatherServiceProtocol {
    
    func getMatchingCities(forQuery query: String) async -> Result<[LocationCoordinates], RequestError> 
}

class WeatherService: HTTPClient {
    
    static let shared = WeatherService()
    let limit = "5"
    let apiKey = "15e0c36e638616deac74caf6d54e703e"
    
    private init() {}
    
    /*
    func getCurrentWeather() -> Result<Any, RequestError> {
        
        // get city coordinates
         // get current weather data
        // transform weather data
        return .failure(.unexpected(nil))
    }*/
    
    func getMatchingCities(forQuery query: String) async -> Result<[LocationCoordinates], RequestError> {
        
        let endpoint = "https://api.openweathermap.org/geo/1.0/direct"
        
        guard var endpointURL = URL(string: endpoint) else {
            return .failure(.unexpected())
        }
        
        endpointURL.append(queryItems: [.init(name: "q", value: query),
            .init(name: "limit", value: limit),
            .init(name: "appid", value: apiKey)
        ])
        
        
        let result = await sendRequest(.init(url: endpointURL), responseModel: [LocationCoordinatesAPIModel].self)
        
        do {
            let coordinates = try result.get().map({LocationCoordinates(from: $0)})
            return .success(coordinates)
        } catch {
             return .failure(.unexpected())
        }
 
    }
}
