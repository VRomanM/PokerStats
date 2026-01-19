//
//  PokerSelectButton.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI

struct PokerSelectButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 10) {
                Image(systemName: icon)
                    .font(.system(size: 14))
                Text(title)
                    .font(.system(size: 12, weight: .bold))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 14)
            .background(
                Group {
                    if isSelected {
                        LinearGradient(
                            colors: [
                                Color(hex: "D4AF37"),
                                Color(hex: "B8860B")
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    } else {
                        Color(hex: "0C1A1A")
                    }
                }
            )
            .foregroundColor(isSelected ? .black : Color(hex: "8B7355"))
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        isSelected ? Color(hex: "FFD700") : Color(hex: "8B7355").opacity(0.3),
                        lineWidth: isSelected ? 2 : 1
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}
