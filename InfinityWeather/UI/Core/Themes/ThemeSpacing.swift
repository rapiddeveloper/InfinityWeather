//
//  ThemeSpacing.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct ThemeSpacing {
    
    // Base unit - everything derives from
    static let shared = ThemeSpacing()
    
    private static let baseUnit: CGFloat = 4.0
    // Spacing scale - powers of our base unit
    var xs = baseUnit * 1 // 4pt
    var sm = baseUnit * 2 // 8pt
    var md = baseUnit * 3 // 12pt
    var lg = baseUnit * 6
    var xl = baseUnit * 8
    var xxl = baseUnit * 12
    var xxxl = baseUnit * 16
    // Semantic spacing - for specific use
    var buttonPadding: CGFloat { md }
    var cardPadding: CGFloat { lg }
    var cardRadius: CGFloat { md }
    var btnRadius: CGFloat { lg }

    var sectionSpacing: CGFloat { xl }
    var screenPadding: CGFloat { md }
    var containerPadding: CGFloat { ThemeSpacing.baseUnit * 4 }

}
