//
//  HomeBodyView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct LocationsListView: View {
    
    @Environment(Theme.self) private var theme
    var locations: [LocationCoordinate]
    
    var onViewDetails: (LocationCoordinate) -> Void 
    
    var body: some View {
        Group {
            ForEach(locations) { locationCoordinate in
                Button {
                    onViewDetails(locationCoordinate)
                } label: {
                    LocationCardView(locationCoordinate: locationCoordinate)
                }
                .buttonStyle(.plain)

            }
            Spacer()
            
            
            
        }
        .padding(.horizontal, theme.spacing.containerPadding)
    }
}

struct LocationCardView: View {
    
    @Environment(Theme.self) private var theme
    var locationCoordinate: LocationCoordinate
    
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
