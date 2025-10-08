//
//  MockWeatherService.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/8/25.
//


@testable import InfinityWeather

struct MockWeatherService: WeatherServiceProtocol {
    
    var mockWeather: LocationWeather?
    var mockCities: [LocationCoordinate] = []
    var shouldFail: Bool = false
    
    func getMatchingCities(forQuery query: String) async -> Result<[LocationCoordinate], RequestError> {
        if shouldFail {
            return .failure(.unexpected("Failed to fetch cities"))
        }
        return .success(mockCities)
    }
    
    func getCurrentWeather(forLocation location: LocationCoordinate) async -> Result<LocationWeather, RequestError> {
        if shouldFail {
            return .failure(.unexpected("Network error"))
        }
        if let mockWeather = mockWeather {
            return .success(mockWeather)
        } else {
            return .failure(.unexpected("No mock weather available"))
        }
    }
}