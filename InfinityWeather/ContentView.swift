//
//  ContentView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
/*
 Abstract: The main tab view of the app.
 */

import SwiftUI

struct ContentView: View {
    
    @Environment(Theme.self) private var theme
    
    @State private var selection: MainTab = .home
    
    var body: some View {
        TabView(selection: $selection) {
            ForEach(MainTab.allCases) { tab in
                Tab(tab.name, systemImage: tab.image, value: tab) {
                    switch tab {
                    case .home:
                        HomeView()
                     case .favorites:
                        Text("Favorites")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(Theme())
}
