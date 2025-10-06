//
//  ContainerStyle.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//


//
//  ContainerStyle.swift
//  TerraTrek
//
//  Created by Orisajobi Akinbola on 9/12/25.
//

import SwiftUI

struct ContainerStyle: ViewModifier {
    
    @Environment(Theme.self) var theme
     @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
//    var isCompact: Bool {
//        horizontalSizeClass == .compact
//    }
     
    func body(content: Content) -> some View {
        content

            .scrollContentBackground(.hidden)
            .toolbarBackground(theme.colors.surfaceContainerHighestColor, for: .navigationBar)
            .background(theme.colors.backgroundColor)

    }
}

extension View {
    
    func containerStyle() -> some View {
        modifier(ContainerStyle())
    }
}
