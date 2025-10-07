//
//  ThemeColors.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct ThemeColors {
    
    static let shared = ThemeColors()
    
    var backgroundColor = Color(.background)
    var primaryColor = Color(.primary)
    var onPrimaryColor = Color(.onPrimary)
    /*
    var primaryContainerColor = Color(.primaryContainer)
    var onPrimaryContainerColor = Color(.onPrimaryContainer)
    var secondaryColor = Color(.secondary)
    var secondaryContainerColor = Color(.secondaryContainer)
    var onSecondaryColor = Color(.onSecondary)
    var tertiaryColor = Color(.tertiary)
    var onTertiaryColor = Color(.onTertiary)
     */
    var surfaceColor = Color(.surface)
    var surfaceContainerColor = Color(.surfaceContainer)
    var surfaceContainerLowColor = Color(.surfaceContainerLow)
    
    var onSurfaceColor = Color(.onSurface)
    /*
     var scrimColor = Color(.scrim)
     var inverseSurfaceColor = Color(.inverseSurface)
     var onSurfaceVariantColor = Color(.planOnSurfaceVariant)
     var surfaceVariantColor = Color(.planSurfaceVariant)
     */
    var surfaceContainerHighestColor = Color(.surfaceContainerHighest)
    var surfaceContainerHighColor = Color(.surfaceContainerHigh)
}
