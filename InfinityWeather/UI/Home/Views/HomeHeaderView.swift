//
//  HomeHeaderView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct HomeHeaderView: View {
    
    @Environment(Theme.self) private var theme
    @Binding var homeVM: HomeViewModel


    var body: some View {
        VStack {
            Text("Weather Summary")
           // WeatherSummaryView(item: homeVM.weather)
        }
        
        .containerRelativeFrame(.vertical, alignment: .center) { len, axis in
            if axis == .vertical {
                return len * 0.40
            }
            return len
        }
        .padding(.horizontal, theme.spacing.containerPadding)
        .background(theme.colors.surfaceContainerColor)
    }
}
