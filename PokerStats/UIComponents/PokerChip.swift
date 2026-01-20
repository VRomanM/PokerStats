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
                            LinearGradient.secondary
                        )
                        .frame(width: 150, height: 150)
                        .shadow(color: .backgroundSecondaryShade1, radius: 10, x: 0, y: 5)
                    
                    // Внутренний круг
                    Circle()
                        .fill(Color.backgroundSecondaryShade3)
                        .frame(width: 130, height: 130)
                    
                    // Emoji
                    Text(text)
                        .font(.system(size: 60))
                }
                .onTapGesture {
                    action()
                }
            }
        }
    }
}

#Preview {
    PokerChip(text: "💰", action: {})
}
