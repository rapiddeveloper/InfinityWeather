//
//  Favorites.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct Favorites: View {
    
    @Environment(FavoritesStore.self) private var favoritesStore
    
    var body: some View {
        NavigationStack {
            FavoritesView(favoriteLocations: favoritesStore.favorites, onViewDetails: handleViewDetails)
                .navigationTitle("Favorites")
        }
       
    }
}


extension Favorites {
    
    private func handleViewDetails(_ location: LocationCoordinate) {
        
    }
}

#Preview {
    Favorites()
}
