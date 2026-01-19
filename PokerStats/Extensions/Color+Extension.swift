//
//  Color+Extension.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI

extension Color {
//    init(hex: String) {
//        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
//        var int: UInt64 = 0
//        Scanner(string: hex).scanHexInt64(&int)
//        let a, r, g, b: UInt64
//        switch hex.count {
//        case 3: // RGB (12-bit)
//            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
//        case 6: // RGB (24-bit)
//            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
//        case 8: // ARGB (32-bit)
//            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
//        default:
//            (a, r, g, b) = (255, 0, 0, 0)
//        }
//        self.init(
//            .sRGB,
//            red: Double(r) / 255,
//            green: Double(g) / 255,
//            blue: Double(b) / 255,
//            opacity: Double(a) / 255
//        )
//    }
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
    
    static var backgroundPrimary: Color {
        return Color(hex: "1A2E2E")
    }
    
    static var backgroundSecondary: Color {
        return Color(hex: "#F0F1F3")
    }
    
    static var backgroundSecondaryActive: Color {
        return Color(hex: "#E3E5E8")
    }
    
    static var backgroundBorder: Color {
        return Color(hex: "#CCD0D6")
    }
    
    static var backgroundAccent1: Color {
        return Color(hex: "#FF324A")
    }
    
    static var backgroundAccent2: Color {
        return Color(hex: "#FF4941")
    }
    
    static var backgroundAccentActive1: Color {
        return Color(hex: "#F0233B")
    }
    
    static var backgroundAccentActive2: Color {
        return Color(hex: "#EF3931")
    }
    
    //MARK: - Text
    
    static var textPrimary: Color {
        return Color(hex: "#001530")
    }
    
    static var textSecondary: Color {
        return Color(hex: "#4D5C6E")
    }
    
    static var textTertiary: Color {
        return Color(hex: "#99A1AC")
    }
    
    static var textWhite: Color {
        return Color(hex: "#FFFFFF")
    }
    
    static var textWhiteOpacity: Color {
        return Color(hex: "#FFFFFF", alpha: 0.7)
    }
    
    static var textNegative: Color {
        return Color(hex: "#DD273D")
    }
    
    static var textPositive: Color {
        return Color(hex: "#00B92D")
    }
    
    static var textLink: Color {
        return Color(hex: "#428BF9")
    }
    
    //MARK: - White
    
    static var mainWhite: Color {
        return Color(hex: "#FFFFFF")
    }
    
    //MARK: - Blue
    
    static var mainBlue: Color {
        return Color(hex: "#3D7EDE")
    }
    
    //MARK: - Gray
    
    static var mainGray: Color {
        return Color(hex: "#EFEFF0")
    }
    
    static var secondGray: Color {
        return Color(hex: "#767676")
    }
    
    static var thirdGray: Color {
        return Color(hex: "#F6F6F6")
    }
    
    static var fourGray: Color {
        return Color(hex: "#8F8F8F")
    }
    
    static var fifthGray: Color {
        return Color(hex: "#E9E9E9")
    }
    
    static var sixthGray: Color {
        return Color(hex: "#5A5A60")
    }
    
    //MARK: - Red
    
    static var mainRed: Color {
        return Color(hex: "#E54A08")
    }
    
    //MARK: - Black
    
    static var mainBlack: Color {
        return Color(hex: "#2E2E30")
    }
    
    static var secondBlack: Color {
        return Color(hex: "#4A4A4A")
    }
    
    static var thirdBlack: Color {
        return Color(hex: "#090909")
    }
    
    static var fourBlack: Color {
        return Color(hex: "#000000")
    }
    
    static var fifthBlack: Color {
        return Color(hex: "#24252B")
    }
}
