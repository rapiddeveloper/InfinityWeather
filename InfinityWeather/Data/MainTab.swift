//
//  MainTabs.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

enum MainTab: String, CaseIterable, Identifiable {
    case home
    case favorites
    
    var name: String {
        switch self {
        case .home:
            return "Home"
        case .favorites:
            return "Favorites"
        }
    }
    
    var image: String {
        switch self {
        case .home:
            return "house"
        case .favorites:
            return "star"
        }
    }
    
    var id: Self {
        self
    }
}
