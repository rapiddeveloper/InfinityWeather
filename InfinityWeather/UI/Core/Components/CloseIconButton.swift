//
//  CloseIconButton.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct IconButton: View {
    
    @Environment(Theme.self) private var theme
    var systemImage: String
    var isEnabled: Bool = false

    var action: () -> Void = {}

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: systemImage)
                .foregroundStyle(isEnabled ? theme.colors.primaryColor : theme.colors.onSurfaceColor)
                .background(content: {
                    Circle()
                        .fill(theme.colors.onPrimaryColor)
                        .frame(width: 32, height: 32)
                })
        })
    }
}
