//
//  FavoritesView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct FavoritesView: View {
    
    @Environment(FavoritesStore.self) var favoritesStore
    @Environment(Theme.self) var theme
    
    var favoriteLocations: [LocationCoordinate]
    var onViewDetails: (LocationCoordinate) -> Void
    
    var body: some View {
        InifinityScrollView(spacing: theme.spacing.containerPadding) {
            
            LocationsListView(locations: favoriteLocations, onViewDetails: onViewDetails)
            
            if favoriteLocations.isEmpty {
                VStack(spacing: theme.spacing.containerPadding) {
                    Text("No favorites yet")
                        .font(.title3)
                     Text("Add a location to your favorites by tapping on the star icon on the details screen.")
                        .font(.caption)
                        
                }
                .multilineTextAlignment(.center)
                .foregroundColor(theme.colors.onSurfaceColor)

                
            }
        }
        
    }
}

//#Preview {
//    FavoritesView()
//}
