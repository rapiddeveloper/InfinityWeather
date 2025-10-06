//
//  InfinityButton.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct InfinityButton<Content:View> : View {
    
    @Environment(Theme.self) private var theme
    var action: ()->Void = {}
    var label: ()->Content
    
    var body: some View {
        Button {
            print("something")
        } label: {
            Text("View Details")
                .font(theme.fonts.button)
                .padding(.vertical, theme.spacing.sm)
                .frame(maxWidth: .infinity)
            
        }
        .tint(theme.colors.primaryColor)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.roundedRectangle(radius: theme.spacing.btnRadius))
    }
}

//#Preview {
//    InfinityButton()
//}
