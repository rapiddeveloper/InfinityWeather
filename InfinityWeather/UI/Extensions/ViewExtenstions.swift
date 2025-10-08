//
//  ViewExtenstions.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/8/25.
//

import SwiftUI

extension View {
    func roundedFont(_ font: Font? = .body) -> some View {
        self
            .fontDesign(.rounded)
            .font(font)
            
    }
}
