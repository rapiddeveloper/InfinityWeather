//
//  WeatherDetailsScreen.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
/*
 Abstract: Entry point for the Weather details screen
 */

import SwiftUI

struct WeatherDetails: View {
    
    var location: LocationCoordinates?
    @State private var weatherDetailsVM: WeatherStore = WeatherStore()
    @Environment(ErrorDetails.self) private var errorDetails
    @Environment(\.dismiss) private var dismiss
    @State private var weatherDetailsStatus: RequestStatus = .idle
    
     init(location: LocationCoordinates? = nil) {
         self.location = location
       //  _weatherDetailsVM = State(initialValue: WeatherStore())
    }
    
    var body: some View {
        WeatherDetailsView(weather: weatherDetailsVM.weather, detailsStatus: weatherDetailsStatus)
                .toolbar(content: {
                    ToolbarItem(placement: .cancellationAction) {
                        IconButton(systemImage: "xmark") {
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        IconButton(systemImage: "star.fill") {
                            
                        }
                    }
                })
                .onAppear(perform: handleAppear)
        
    
    }
}

extension WeatherDetails {
    private func handleAppear() {
          Task {
            guard  let location = location, weatherDetailsStatus == .idle ||
                  weatherDetailsStatus == .completed else { return }
                  weatherDetailsStatus = .pending
            do {
                try await weatherDetailsVM.loadWeather(forLocation: location)
                weatherDetailsStatus = .completed

            }catch(let error as RequestError) {
                weatherDetailsStatus = .failed(error)
            } catch {
                weatherDetailsStatus = .failed(.unexpected(error.localizedDescription))
            }
        }
    }
}

#Preview {
    WeatherDetails()
}
