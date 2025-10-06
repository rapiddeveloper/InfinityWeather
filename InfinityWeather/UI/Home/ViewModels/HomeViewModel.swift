//
//  HomeViewModel.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

@Observable
class HomeViewModel {
    
    var city: String = ""
    var weather: Weather?
    
    init() {
        
    }
    
    init(weather: Weather? = nil) {
        self.weather = weather
    }
}
