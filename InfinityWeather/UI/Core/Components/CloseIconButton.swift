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
    var action: () -> Void = {}

    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image(systemName: systemImage)
                .foregroundStyle(theme.colors.primaryColor)
                .background(content: {
                    Circle()
                        .fill(theme.colors.onPrimaryColor)
                        .frame(width: 32, height: 32)
                })
        })
    }
}
