//
//  Home.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct Home: View {
    
    @State private var homeVM = HomeViewModel(weather: .previewItem)
    @Environment(ErrorDetails.self) private var errorDetails
    @State private var handleSearchStatus: RequestStatus = .idle
    @State private var selectedLocation : LocationCoordinates?
    
    var body: some View {
        NavigationStack {
            HomeView(searchCity: $homeVM.city, searchStatus: handleSearchStatus, locations: homeVM.searchResults, onBeginSearch: handleBeginSearch, onViewDetails: handleViewDetails)
                .fullScreenCover(item: $selectedLocation, content: { location in
                    NavigationStack {
                        WeatherDetails(location: location)
                       
                    }
                    
                })
                
        }
     }
}

extension Home {
    
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
    
    func handleViewDetails(coordinate: LocationCoordinates) {
        selectedLocation = coordinate
    }
}

#Preview {
    Home()
}
