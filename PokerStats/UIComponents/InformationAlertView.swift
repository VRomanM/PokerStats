//
//  InformationAlertView.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI

struct InformationAlertView: View {
    var title: String
    var message: String
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 50))
                .foregroundColor(.backgroundPrimaryShade1)
            
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color.textWhite)
            
            Text(message)
                .font(.subheadline)
                .foregroundColor(.backgroundPrimaryShade1)
        }
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    LinearGradient.pokerClothReverse
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.backgroundPrimaryShade1.opacity(0.3), lineWidth: 1)
                )
                .shadow(color: .backgroundSecondaryShade1, radius: 20, x: 0, y: 10)
        )
        .padding(.horizontal, 40)
    }
}

#Preview {
    InformationAlertView(title: "Title", message: "Message")
}
