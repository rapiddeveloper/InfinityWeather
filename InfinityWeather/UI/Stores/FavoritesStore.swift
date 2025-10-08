//
//  FavoritesStore.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/8/25.
/*
 Abstract: A store that manages favorited locations
 */

import SwiftUI

@Observable
final class FavoritesStore {
    
    private let storageKey = "favorites"
       
       // AppStorage isn't directly observable by @Observable
       // So we access it via UserDefaults instead.
    private let storage = UserDefaults.standard
 
    private(set) var favorites: [LocationCoordinate] = []

    init() {
        loadLocations()
    }

    func saveLocation(_ location: LocationCoordinate?) {
        
        guard let location = location,
             !hasSavedLocation(location) else { return }

        favorites.append(location)
        
        if let encoded = try? JSONEncoder().encode(favorites) {
            storage.set(encoded, forKey: storageKey)
         }
    }
    
    func hasSavedLocation(_ location: LocationCoordinate?) -> Bool {
        favorites.contains(where: {$0 == location})
    }

    private func loadLocations() {
        guard let savedLocationsData = storage.data(forKey: storageKey) else {return}
        if let decoded = try? JSONDecoder().decode(
            [LocationCoordinate].self, from: savedLocationsData)
        {
            favorites = decoded
        }
    }
}

extension FavoritesStore {
    var recentlyFavoritedCity: String {
        favorites.last?.city ?? ""
    }
}
