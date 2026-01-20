//
//  PokerButton.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI

struct PokerButton: View {
    enum FontSize: CGFloat {
        case small = 12
        case medium = 14
        case large = 18
    }
    
    let title: String
    let icon: String
    let fontSize: FontSize
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                Text(title)
                    .font(.system(size: fontSize.rawValue, weight: .bold))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 18)
            .padding(.horizontal, 20)
            .background(
                Group {
                    if isSelected {
                        LinearGradient.primary
                    } else {
                        Color.backgroundSecondaryShade1
                    }
                }
            )
            .foregroundColor(isSelected ? .backgroundSecondaryShade1 : .backgroundPrimaryShade2)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(
                        isSelected ? Color.backgroundPrimaryShade3 : .backgroundPrimaryShade2.opacity(0.3),
                        lineWidth: isSelected ? 2 : 1
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(1)
    }
    
    init(title: String, icon: String, fontSize: FontSize = .medium, isSelected: Bool = true, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.fontSize = fontSize
        self.isSelected = isSelected
        self.action = action
    }
}

#Preview {
    PokerButton(title: "Title", icon: "ballhand.fill", action: { print("Save player")})
    PokerButton(title: "Title", icon: "ballhand.fill", isSelected: false,  action: { print("Save player") })
}
