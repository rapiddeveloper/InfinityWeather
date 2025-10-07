//
//  HomeBodyView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct HomeBodyView: View {
    
    @Environment(Theme.self) private var theme
    var locations: [LocationCoordinates]
    
    var onViewDetails: (LocationCoordinates) -> Void 
    
    var body: some View {
        Group {
            ForEach(locations) { locationCoordinate in
                Button {
                    onViewDetails(locationCoordinate)
                } label: {
                    LocationCardView(locationCoordinate: locationCoordinate)
                }

            }
            Spacer()
            
            
            
        }
        .padding(.horizontal, theme.spacing.containerPadding)
    }
}

struct LocationCardView: View {
    
    @Environment(Theme.self) private var theme
    var locationCoordinate: LocationCoordinates
    
    var body: some View {
        VStack(alignment: .leading, spacing: theme.spacing.md) {
            Text(locationCoordinate.city)
                .font(.headline)
            if !locationCoordinate.state.isEmpty {
                Text(locationCoordinate.state)
                    .font(.caption)
            }
            Text(locationCoordinate.countryCode)
                .font(.caption)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(theme.colors.surfaceColor, in: RoundedRectangle(cornerRadius: theme.spacing.containerPadding))
    }
}
