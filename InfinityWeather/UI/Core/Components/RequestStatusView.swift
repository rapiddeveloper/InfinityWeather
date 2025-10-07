//
//  RequestStatusView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct RequestStatusView: View {
    
    var status: RequestStatus
    var color: Color = Color(uiColor: .black)
    var perform: ()  -> Void
    @Environment(Theme.self) private var theme
    
    var body: some View {
        VStack {
            
            if status == .pending {
                
                ProgressView()
                    .controlSize(.regular)
                    .tint(theme.colors.primaryColor)
 
            } else if case .failed(let error) = status {
                NoLoadedData(message: error.errorDescription ?? "") {
                    perform()
                }
                
            }
            
        }
       // .gridCellColumns(2)
       // .frame(maxWidth: .infinity)
        
         
    }
}
