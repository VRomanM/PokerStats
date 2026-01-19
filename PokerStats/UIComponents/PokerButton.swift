//
//  PokerButton.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI

struct PokerButton: View {
    enum Style {
        case primary
        case secondary
    }
    
    let title: String
    let icon: String
    let action: () -> Void
    let style: Style
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                Text(title)
                    .fontWeight(.bold)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, style == .primary ? 18 : 14)
            .padding(.horizontal, 20)
            .background(
                Group {
                    switch style {
                    case .primary:
                        LinearGradient(
                            colors: [
                                Color(hex: "D4AF37"),
                                Color(hex: "B8860B")
                            ],
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    case .secondary:
                        Color.clear
                    }
                }
            )
            .foregroundColor(style == .primary ? .black : Color(hex: "D4AF37"))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(
                        style == .primary ? Color(hex: "FFD700") : Color(hex: "D4AF37").opacity(0.5),
                        lineWidth: style == .primary ? 0 : 2
                    )
            )
            .shadow(
                color: style == .primary ? Color(hex: "D4AF37").opacity(0.4) : .clear,
                radius: style == .primary ? 10 : 0,
                x: 0,
                y: style == .primary ? 5 : 0
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(style == .primary ? 1 : 0.95)
    }
}
