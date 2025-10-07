//
//  HomeView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var searchCity: String
    var searchStatus: RequestStatus
    var locations: [LocationCoordinates]
    var onBeginSearch: () -> Void
    var onViewDetails: (LocationCoordinates) -> Void
    
    @Environment(Theme.self) private var theme
 
    var body: some View {
            InifinityScrollView(spacing: theme.spacing.containerPadding) {
                if  !locations.isEmpty {
                    Text("Now showing \(locations.count) matching locations for \(searchCity)")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                }
                LocationsListView(locations: locations, onViewDetails: onViewDetails)

                if searchStatus == .completed && locations.isEmpty {
                    Text("No matching locations found for \(searchCity)")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                }
                
                if searchStatus == .idle && locations.isEmpty {
                    Text("Get started by searching for a city")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                }
                
                if searchStatus == .pending {
                    ProgressView()
                        .tint(theme.colors.primaryColor)
                }
                
            }
            
            .searchable(text: $searchCity, prompt: "Enter a city")
            .onSubmit(of: .search, {
                onBeginSearch()
            })
            .navigationTitle("Home")
        

    }
}

 

#Preview {
    HomeView(searchCity: .constant(""), searchStatus: .idle, locations: [], onBeginSearch: {
        
    }, onViewDetails: { _ in
        
    })
        .environment(Theme())
}

