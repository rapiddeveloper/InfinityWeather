//
//  WeatherHeaderStyle.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct WeatherHeaderStyle: ViewModifier {

    @Environment(Theme.self) var theme
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    let heightScaleFactor = 0.45

    func body(content: Content) -> some View {
        VStack {
            content
        }
        .frame(maxWidth: .infinity)
        .containerRelativeFrame(.vertical, alignment: .center) { len, axis in
            if axis == .vertical {
                return len * heightScaleFactor
            }
            return len
        }
        .padding(.horizontal, theme.spacing.containerPadding)
        .background(theme.colors.surfaceContainerHighColor)
         

    }
}

extension View {

    func weatherHeaderStyle() -> some View {
        modifier(WeatherHeaderStyle())
    }
}
