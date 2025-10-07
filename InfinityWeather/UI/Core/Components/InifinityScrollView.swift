//
//  InifinityScrollView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct InifinityScrollView<Content>: View where Content: View {
    
    var content: () -> Content
    var spacing: CGFloat
    
    init(spacing: CGFloat = 0, @ViewBuilder content:  @escaping () -> Content) {
        self.content = content
        self.spacing = spacing
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: spacing) {
                content()
            }
          
        }
        .scrollIndicators(.hidden)
         .containerStyle()
    }
}

#Preview {
    InifinityScrollView {
         Text("Hello World.")
    }
}
