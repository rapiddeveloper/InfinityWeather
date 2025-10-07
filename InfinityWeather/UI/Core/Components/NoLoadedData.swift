//
//  NoLoadedData.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct NoLoadedData: View {
    
    let message: String
    let retryAction: (() -> Void)?
    
    @Environment(Theme.self) private var theme
    
    init(message: String, retryAction: (() -> Void)? = nil) {
        self.message = message
        self.retryAction = retryAction
    }
    
    var body: some View {
        VStack(spacing: Constants.spacing) {
            
            Text("\(message)")
                .foregroundColor(Color(uiColor: .systemGray))
                .font(.footnote)
                .multilineTextAlignment(.center)
            Button {
                retryAction?()
            } label: {
 
                HStack(spacing: 4) {
                    Image(systemName: "arrow.clockwise")
                    Text("Retry")
                }
                .font(.subheadline)
                .foregroundStyle(theme.colors.onSurfaceColor)

            }
            .buttonStyle(.bordered)
            .controlSize(.regular)
            .tint(.white)
            .background(content: {
                RoundedRectangle(cornerRadius: Constants.cornerRadius)
                    .strokeBorder(theme.colors.onSurfaceColor, lineWidth: Constants.lineWidth)
            })
            
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        // .padding()
    }
    
    private struct Constants {
        static let spacing: CGFloat = 16.0
        static let cornerRadius: CGFloat = 8.0
        static let lineWidth: CGFloat = 2.0
        static let minWidth: CGFloat = 0
        static let minHeight: CGFloat = 0
        
    }
}
