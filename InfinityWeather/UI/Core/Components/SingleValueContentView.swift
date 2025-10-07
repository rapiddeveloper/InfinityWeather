//
//  SingleValueContentView.swift
//  InfinityWeather
//
//  Created by Orisajobi Akinbola on 10/7/25.
//

import SwiftUI

struct SingleValueContentView: View {
    @Environment(Theme.self) private var theme

    var value: String
    var description: String
    var details: AttributeDetails?
    var detailsLabel: String? 

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Large Value
            Text(value)
                .font(.largeTitle)
                .padding(.bottom, 2)

            // Sub-Description
            Text(description)
                .font(.caption2)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            Spacer()
            // Optional Details List (like Today/Average)
            if let details = details, !details.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    //   Spacer().frame(height: theme.spacing.md) // Add space before details
                    ForEach(details, id: \.label) { detail in
                        HStack {
                            Text(detail.label)
                                .font(.caption)
                            Spacer()
                            Text(detail.value)
                                .font(.caption.weight(.medium))
                        }
                    }
                }
            } else if let detailsLabel = self.detailsLabel {
                Text(detailsLabel)
                    .font(.caption)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
