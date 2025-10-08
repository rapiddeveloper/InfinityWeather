//
//  SplashScreen.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/8/25.
//

import SwiftUI

struct SplashScreen: View {

    @Environment(Theme.self) private var theme

    var body: some View {
       // if !isFinished {
            VStack {
                VStack(spacing: theme.spacing.lg) {
                    Text("Welcome to Infinity Weather")
                        .font(.largeTitle)
                    Text("Get the latest current weather in the world")
                        .font(.title2)

                }
                .foregroundStyle(theme.colors.onPrimaryColor)
                .multilineTextAlignment(.center)
                .bold()
                .fontDesign(.rounded)
                .frame(maxWidth: .infinity)

            }
             .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(theme.colors.primaryColor, ignoresSafeAreaEdges: .all)
           
       // }
     }

}

#Preview {
    SplashScreen()
        .environment(Theme())
}
