//
//  GeoLocationElement.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//


struct LocationCoordinatesAPIModel: Codable {
    let name: String
    let lat, lon: Double
    let country: String
    let state: String?
}
