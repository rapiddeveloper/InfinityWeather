//
//  InifinityScrollView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

struct InifinityScrollView<Content>: View where Content: View {
    
    var content: () -> Content
    
    init(@ViewBuilder content:  @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                content()
            }
          
        }
        .scrollIndicators(.hidden)
       //  .ignoresSafeArea()
        .containerStyle()
    }
}

#Preview {
    InifinityScrollView {
         Text("Hello World.")
    }
}
