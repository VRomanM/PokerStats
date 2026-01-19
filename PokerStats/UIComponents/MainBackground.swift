//
//  MainBackground.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI

struct MainBackground: View {
    var body: some View {
        // Фон в стиле покерного стола
        LinearGradient(
            colors: [Color(hex: "0C1A1A"), Color(hex: "152424"), Color(hex: "1A2E2E")],
            startPoint: .top,
            endPoint: .bottom
        )
    }
}
