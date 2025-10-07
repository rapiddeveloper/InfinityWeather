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
    
    var body: some View {
        HomeView(searchCity: $homeVM.city, searchStatus: handleSearchStatus, locations: homeVM.searchResults, onBeginSearch: handleBeginSearch, onViewDetails: handleViewDetails)
     }
}

extension Home {
    
    func handleBeginSearch()  {
        
        Task {
            guard handleSearchStatus == .idle || handleSearchStatus == .completed else { return }
            do {
                handleSearchStatus = .pending
                try await homeVM.findMatchingCities()
                handleSearchStatus = .completed
            } catch(let error as RequestError) {
                errorDetails.setRequestError(error)
            } catch {
                errorDetails.setRequestError(.unexpected(error.localizedDescription))
            }
        }
    }
    
    func handleViewDetails(coordinate: LocationCoordinates) {
        
    }
}

#Preview {
    Home()
}
