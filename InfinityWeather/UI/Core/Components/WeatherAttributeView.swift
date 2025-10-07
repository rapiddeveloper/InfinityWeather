//
//  WeatherAttributeView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct WeatherAttributeView<Content>: View where Content: View {
    
    @Environment(Theme.self) private var theme
    
    var header: () -> Content
   // var value: String
  //  var footer: String
    
    // MARK :- closures that changes type of view
    private var valueContent: () -> AnyView
    private var footerContent: () -> AnyView

    
    init(header: @escaping () -> Content, value: String, footer: String) {
        self.header = header
        self.valueContent = { AnyView(Text(value)) }
        self.footerContent = { AnyView(Text(footer)) }
    }
    
    init(header: @escaping () -> Content,
         value: @escaping () -> Content, footer: @escaping () -> Content) {
        self.header = header
        self.valueContent = {AnyView(value())}
        self.footerContent = {AnyView(footer())}
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
           header()
             valueContent()
                .font(.largeTitle)
                //.font(theme.fonts.h3Headline)
            Spacer()
             footerContent()
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
               // .font(theme.fonts.caption)
               // .padding(-2)

        }
        .padding(.horizontal, theme.spacing.sm)
        .padding(.vertical, theme.spacing.md)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)

 
    }
}
 
#Preview(traits: .fixedLayout(width: 180, height: 180)) {
    
    WeatherAttributeView(header: {
        Label {
            Text("FEELS LIKE")
                .font(.subheadline)
                .fontWeight(.medium)
        } icon: {
            Image(systemName:  "cloud.drizzle.fill")
        }

      }, value: "29°C", footer: "Similar to the actual temperature")
    .environment(Theme())
 }
