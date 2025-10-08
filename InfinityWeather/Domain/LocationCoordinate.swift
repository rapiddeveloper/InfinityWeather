//
//  GeoLocationElement.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

struct LocationCoordinate: Identifiable, Hashable, Codable {
    let city: String
    let lat, lon: String
    let countryCode: String
    let state: String

    var id: String {
        lon + lat
    }

    var fullName: String {
        "\(city), \(state), \(countryCode)"
    }

    init(
        city: String, lat: String, lon: String, countryCode: String,
        state: String
    ) {
        self.city = city
        self.lat = lat
        self.lon = lon
        self.countryCode = countryCode
        self.state = state
    }

    init(from apiModel: LocationCoordinatesAPIModel) {
        self.city = apiModel.name
        self.lat = String(apiModel.lat)
        self.lon = String(apiModel.lon)
        self.countryCode = apiModel.country
        self.state = apiModel.state ?? ""
    }
}
