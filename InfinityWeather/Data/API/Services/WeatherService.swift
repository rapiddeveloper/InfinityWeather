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

    func getMatchingCities(forQuery query: String) async -> Result<
        [LocationCoordinate], RequestError
    >
    func getCurrentWeather(forLocation location: LocationCoordinate) async
        -> Result<LocationWeather, RequestError>
}

class WeatherService: HTTPClient, WeatherServiceProtocol {

    static let shared = WeatherService()
    let limit = "5"
    let apiKey: String
    let baseURL: String = "https://api.openweathermap.org"

    init() {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "OPEN_WEATHER_API_KEY") as? String else {
           fatalError("API_KEY not found in Info.plist")
        }
         
        self.apiKey = apiKey
    }

    
    func getMatchingCities(forQuery query: String) async -> Result<
        [LocationCoordinate], RequestError
    > {

        let endpoint = "\(baseURL)/geo/1.0/direct"

        guard var endpointURL = URL(string: endpoint) else {
            return .failure(.unexpected())
        }

        endpointURL.append(queryItems: [
            .init(name: "q", value: query),
            .init(name: "limit", value: limit),
            .init(name: "appid", value: apiKey),
        ])

        let result = await sendRequest(
            .init(url: endpointURL),
            responseModel: [LocationCoordinatesAPIModel].self)

        do {
            let coordinates = try result.get().map({
                LocationCoordinate(from: $0)
            })
            return .success(coordinates)
        } catch {
            return .failure(.unexpected())
        }

    }

    func getCurrentWeather(forLocation location: LocationCoordinate) async
        -> Result<LocationWeather, RequestError>
    {

        let endpoint = "\(baseURL)/data/2.5/weather"

        guard var endpointURL = URL(string: endpoint) else {
            return .failure(.unexpected())
        }

        endpointURL.append(queryItems: [
            .init(name: "lon", value: location.lon),
            .init(name: "lat", value: location.lat),
            .init(name: "appid", value: apiKey),
        ])

        let result = await sendRequest(
            .init(url: endpointURL), responseModel: LocationWeatherAPIModel.self,
            keyDecodingStrategy: .convertFromSnakeCase
        )
       // print("result:\n \(result)")
        do {
            let weatherAPIModel = try result.get()
            return .success(LocationWeather(from: weatherAPIModel, city: location.city))

        } catch {
            return .failure(.unexpected(error.localizedDescription))

        }
    }
}
