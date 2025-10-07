//
//  InfinityWeatherApp.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/6/25.
//

import SwiftUI

@main
struct InfinityWeatherApp: App {
    
    var theme = Theme()
    /// the error details's  model
    var appErrorDetails = ErrorDetails()
    @State var appError: RequestError?

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
            ContentView()
                
                .environment(theme)
                .environment(appErrorDetails)
                .alert(isPresented: showAlertBinding, error: appErrorDetails.requestError) { _ in
                    Button("OK") {
                        
                    }
                } message: { error in
                    Text(error.recoverySuggestion ?? "Try again later")
                }
        }
    }
}
