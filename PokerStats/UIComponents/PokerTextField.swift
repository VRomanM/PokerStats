//
//  PokerTextField.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI

struct PokerTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    let icon: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.backgroundPrimaryShade1)
                    .font(.caption)
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.backgroundPrimaryShade1)
                Spacer()
            }
            
            TextField(placeholder, text: $text)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.backgroundSecondaryShade1)
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.backgroundPrimaryShade2.opacity(0.3), lineWidth: 1)
                )
                .foregroundColor(Color.textWhite)
                .font(.system(size: 16, weight: .medium))
        }
        .padding(.horizontal)
    }
}

#Preview {
    PokerTextField(title: "Title", placeholder: "Placeholder", text: .constant("Text"), icon: "person")
}
