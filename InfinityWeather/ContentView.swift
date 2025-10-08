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
    @Environment(NavigationRouter.self) private var router
    //@State private var selectedTab: In
    
 
    var body: some View {
        
        @Bindable var bindableRouter = self.router
        
        TabView(selection: $bindableRouter.route) {
            ForEach(bindableRouter.mainRoutes) { tab in
                Tab(tab.name, systemImage: tab.image, value: tab) {
                    if tab == .home {
                        Home()
                    } else if tab == .favorites {
                        Favorites()
                    }
                   
                }
                
            }
        }
        .tint(theme.colors.primaryColor)
    }
}

#Preview {
    ContentView()
        .environment(Theme())
}
