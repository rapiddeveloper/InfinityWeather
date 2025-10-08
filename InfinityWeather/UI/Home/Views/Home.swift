//
//  Home.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct Home: View {
    
    @Environment(ErrorDetails.self) private var errorDetails
    @Environment(FavoritesStore.self) private var favoritesStore
    @Environment(NavigationRouter.self) private var router
    
    @State private var homeVM = HomeViewModel()
    @State private var handleSearchStatus: RequestStatus = .idle
    @State private var selectedLocation : LocationCoordinate?
    @State private var hasPrepopulatedSearchCity = false

    
    var body: some View {
        NavigationStack {
            HomeView(searchCity: $homeVM.city, searchStatus: handleSearchStatus, locations: homeVM.searchResults, onBeginSearch: handleBeginSearch, onViewDetails: handleViewDetails)
                .fullScreenCover(item: $selectedLocation, content: { location in
                    NavigationStack {
                        WeatherDetails(location: location)
                       
                    }
                    
                })
                .onAppear(perform: handleAppear)
                
 
        }
     }
}

extension Home {
    
    func handleAppear() {
        guard !hasPrepopulatedSearchCity else { return }
        homeVM.updateSearchCity(favoritesStore.recentlyFavoritedCity)
        hasPrepopulatedSearchCity = true
    }
    
    func handleBeginSearch()  {
        
        Task {
            guard handleSearchStatus == .idle || handleSearchStatus == .completed else { return }
            handleSearchStatus = .pending
            do {
                try await homeVM.findMatchingCities()
                handleSearchStatus = .completed
            } catch(let error as RequestError) {
                errorDetails.setRequestError(error)
                handleSearchStatus = .failed(error)
            } catch {
                errorDetails.setRequestError(.unexpected(error.localizedDescription))
                handleSearchStatus = .failed(.unexpected(error.localizedDescription))
            }
        }
    }
    
    func handleViewDetails(coordinate: LocationCoordinate) {
        selectedLocation = coordinate
    }
}

#Preview {
    Home()
}
