//
//  HomeView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct HomeView: View {

    @Environment(Theme.self) private var theme
    @State private var homeVM = HomeViewModel(weather: .previewItem)

    var body: some View {
        NavigationStack {
            InifinityScrollView {
 
               
                    HomeHeaderView(homeVM: $homeVM)
                    HomeBodyView(onViewDetails: handleViewDetails)
                
             

            }
            .searchable(text: $homeVM.city, prompt: "Enter a city")
            .navigationTitle("Home")
        }

    }
}

extension HomeView {
    private func handleViewDetails() {

    }
}

#Preview {
    HomeView()
        .environment(Theme())
}

