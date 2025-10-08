//
//  InfinityWeatherApp.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

@main
struct InfinityWeatherApp: App {

    @State var isFinished = false

    var theme = Theme()
    var router = NavigationRouter()
    /// the error details's  model
    var appErrorDetails = ErrorDetails()
    var favoritesStore = FavoritesStore()

    var showAlertBinding: Binding<Bool> {
        Binding {
            appErrorDetails.requestError != nil
        } set: { newValue in
            if newValue == false {
                appErrorDetails.setRequestError(nil)
            }
        }

    }
    var body: some Scene {
        WindowGroup {

            if !isFinished {
                SplashScreen()
                    .environment(theme)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: 3.0)) {
                                isFinished = true
                            }
                        }
                    }
            } else {
                ContentView()
                    .environment(theme)
                    .environment(appErrorDetails)
                    .environment(favoritesStore)
                    .environment(router)
                    .alert(
                        isPresented: showAlertBinding,
                        error: appErrorDetails.requestError
                    ) { _ in
                        Button("OK") {

                        }
                    } message: { error in
                        Text(error.recoverySuggestion ?? "Try again later")
                    }

            }

        }
    }
}
