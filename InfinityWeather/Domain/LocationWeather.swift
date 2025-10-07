//
//  WeatherResult.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import Foundation

struct LocationWeather {
    
    var displayTempRange: String
    var icon: String
    var displayActualTemp: String
    var avgTemp: String
    var condition: String
    var avgTempLevel: String
    var city: String
    
    var attributes: [WeatherAttribute] = []
}

extension LocationWeather {
    init(from apiModel: LocationWeatherAPIModel, city: String) {
        
        // MARK: - Basic Weather Info
        let temp = apiModel.main?.temp ?? 0
        let tempMin = apiModel.main?.tempMin ?? 0
        let tempMax = apiModel.main?.tempMax ?? 0
        let condition = apiModel.weather?.first?.main ?? "N/A"
        let icon = apiModel.weather?.first?.icon ?? "cloud.fill"
       // let feelsLike = apiModel.main?.feelsLike ?? 0
        
        // MARK: - Display Values
        self.city = city
        self.displayTempRange = "\(Int(tempMin))° - \(Int(tempMax))°"
        self.displayActualTemp = "\(Int(temp))°"
        self.avgTemp = "\(Int((tempMin + tempMax) / 2))°"
        self.condition = condition
        self.icon = icon
        self.avgTempLevel = temp > 25 ? "Warm" : "Cool"
        
        // MARK: - Attributes
        var attrs: [WeatherAttribute] = []
        
        // Temperature (Single Value)
        if let feels = apiModel.main?.feelsLike {
            let feelsLikeAttr = WeatherAttribute(
                systemImage: "thermometer.medium",
                title: "Feels Like",
                style: .singleValue(
                    value: "\(Int(feels))°C",
                    detailsLabel: "Similar to the actual temperature"
                )
            )
            attrs.append(feelsLikeAttr)
        }
        
        // Humidity (Single Value)
        if let humidity = apiModel.main?.humidity {
            let humidityAttr = WeatherAttribute(
                systemImage: "humidity",
                title: "Humidity",
                style: .singleValue(
                    value: "\(humidity)%",
                    detailsLabel: "Relative humidity level"
                )
            )
            attrs.append(humidityAttr)
        }
        
        // Pressure (Single Value)
        if let pressure = apiModel.main?.pressure {
            let pressureAttr = WeatherAttribute(
                systemImage: "gauge.high",
                title: "Pressure",
                style: .singleValue(
                    value: "\(pressure) hPa",
                    detailsLabel: "Atmospheric pressure"
                )
            )
            attrs.append(pressureAttr)
        }
        
        // Wind (List)
        if let wind = apiModel.wind {
            let windAttr = WeatherAttribute(
                systemImage: "wind",
                title: "Wind",
                style: .list(attributes: [
                    (label: "Speed", value: "\(Int(wind.speed ?? 0)) m/s"),
                    (label: "Gusts", value: "\(Int(wind.gust ?? 0)) m/s"),
                    (label: "Direction", value: "\(wind.deg ?? 0)°")
                ])
            )
            attrs.append(windAttr)
        }
        
        // Clouds (Single Value)
        if let clouds = apiModel.clouds?.all {
            let cloudAttr = WeatherAttribute(
                systemImage: "cloud.fill",
                title: "Cloudiness",
                style: .singleValue(
                    value: "\(clouds)%",
                    detailsLabel: "Percentage of sky covered by clouds"
                )
            )
            attrs.append(cloudAttr)
        }
        
        // Visibility (Single Value)
        if let visibility = apiModel.visibility {
            let visibilityAttr = WeatherAttribute(
                systemImage: "eye",
                title: "Visibility",
                style: .singleValue(
                    value: "\(visibility / 1000) km",
                    detailsLabel: "How far you can see clearly"
                )
            )
            attrs.append(visibilityAttr)
        }
        
        // Sunrise/Sunset (List)
        if let sys = apiModel.sys {
            let sunrise = sys.sunrise.map { Date(timeIntervalSince1970: TimeInterval($0)) }
            let sunset = sys.sunset.map { Date(timeIntervalSince1970: TimeInterval($0)) }
            
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            let sysAttr = WeatherAttribute(
                systemImage: "sun.max.fill",
                title: "Daylight",
                style: .list(attributes: [
                    (label: "Sunrise", value: sunrise.map { formatter.string(from: $0) } ?? "—"),
                    (label: "Sunset", value: sunset.map { formatter.string(from: $0) } ?? "—")
                ])
            )
            attrs.append(sysAttr)
        }
        
        self.attributes = attrs
    }
}
