//
//  PokerChip.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI

struct PokerChip: View {
    var text: String
    var action: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            // покерная фишка
            VStack(spacing: 20) {
                ZStack {
                    // Внешний круг - покерная фишка
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [
                                    Color(hex: "FFD700"),
                                    Color(hex: "D4AF37"),
                                    Color(hex: "B8860B")
                                ],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 150, height: 150)
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
                    
                    // Внутренний круг
                    Circle()
                        .fill(Color(hex: "1A2E2E"))
                        .frame(width: 130, height: 130)
                    
                    // Emoji
                    Text(text)
                        .font(.system(size: 60))
                    
                    // Обводка фишки
                    Circle()
                        .stroke(
                            LinearGradient(
                                colors: [Color(hex: "FFD700"), Color(hex: "B8860B")],
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 4
                        )
                        .frame(width: 150, height: 150)
                }
                .onTapGesture {
                    action()
                }
            }
        }
    }
}
