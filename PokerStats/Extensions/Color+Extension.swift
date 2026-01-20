//
//  Color+Extension.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI

extension Color {
    init(hex: String, alpha: Double = 1.0) {
            var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
            
            var rgb: UInt64 = 0
            
            Scanner(string: hexSanitized).scanHexInt64(&rgb)
            
            let red = Double((rgb >> 16) & 0xFF) / 255.0
            let green = Double((rgb >> 8) & 0xFF) / 255.0
            let blue = Double(rgb & 0xFF) / 255.0
            
            self.init(
                .sRGB,
                red: red,
                green: green,
                blue: blue,
                opacity: alpha
            )
        }
    
    //MARK: - Background
    
    static var backgroundPrimaryShade1: Color {
        return Color(hex: "D4AF37")
    }
    
    static var backgroundPrimaryShade2: Color {
        return Color(hex: "#B8860B")
    }
    
    static var backgroundPrimaryShade3: Color {
        return Color(hex: "#FFD700")
    }
    
    static var backgroundSecondaryShade1: Color {
        return Color(hex: "#0C1A1A")
    }
    
    static var backgroundSecondaryShade2: Color {
        return Color(hex: "#152424")
    }
    
    static var backgroundSecondaryShade3: Color {
        return Color(hex: "#1A2E2E")
    }
        
    //MARK: - Text
     
    static var textWhite: Color {
        return Color(hex: "#FFFFFF")
    }
}
