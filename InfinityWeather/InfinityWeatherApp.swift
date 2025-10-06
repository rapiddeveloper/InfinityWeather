//
//  InfinityWeatherApp.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

@main
struct InfinityWeatherApp: App {
    
    var theme = Theme()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(theme)
        }
    }
}
