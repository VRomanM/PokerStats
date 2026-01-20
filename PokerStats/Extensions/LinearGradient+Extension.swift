//
//  LinearGradient+Extension.swift
//  PokerStats
//
//  Created by Роман Вертячих on 20/01/2026.
//

import SwiftUI

extension LinearGradient {
    static var primary: Self {
        LinearGradient(
            colors: [
                .backgroundPrimaryShade1,
                .backgroundPrimaryShade2
            ],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    static var secondary: Self {
        LinearGradient(
            colors: [
                .backgroundPrimaryShade3,
                .backgroundPrimaryShade1,
                .backgroundPrimaryShade2
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    static var border: Self {
        LinearGradient(
            colors: [
                .backgroundPrimaryShade1.opacity(0.3),
                .backgroundPrimaryShade1.opacity(0.1)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    static var pokerCloth: Self {
        LinearGradient(
            colors: [.backgroundSecondaryShade1,
                     .backgroundSecondaryShade2,
                     .backgroundSecondaryShade3],
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    static var pokerClothReverse: Self {
        LinearGradient(
            colors: [.backgroundSecondaryShade3,
                     .backgroundSecondaryShade2,
                     .backgroundSecondaryShade1],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
