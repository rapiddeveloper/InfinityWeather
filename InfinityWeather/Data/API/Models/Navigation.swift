//
//  Navigation.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

enum Route: String, CaseIterable, Identifiable  {
    case home
    case favorites
    case weatherDetails
    
    var name: String {
        switch self {
        case .home:
            return "Home"
        case .favorites:
            return "Favorites"
        case .weatherDetails:
            return "Weather Details"
        }
    }
    
    var image: String {
        switch self {
        case .home:
            return "house"
        case .favorites:
            return "star"
        case .weatherDetails:
            return "cloud.fill"
        }
    }
    
    var id: Self {
        self
    }
}
