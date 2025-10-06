//
//  HomeBodyView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct HomeBodyView: View {
    
    @Environment(Theme.self) private var theme
    var onViewDetails: () -> Void = { }
    
    var body: some View {
        VStack {
            Spacer()
            
            InfinityButton {
                onViewDetails()
            } label: {
                Text("View Details")
                
            }
            
        }
        .padding(.horizontal, theme.spacing.containerPadding)
    }
}
