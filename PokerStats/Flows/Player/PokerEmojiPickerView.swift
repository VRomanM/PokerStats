//
//  PokerEmojiPickerView.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI

struct PokerEmojiPickerView: View {
    @Binding var selectedEmoji: String
    let emojis: [String]
    @Environment(\.dismiss) private var dismiss
    
    let columns = [
        GridItem(.adaptive(minimum: 50))
    ]
    
    private var emojiGrid: some View {
        LazyVGrid(columns: columns, spacing: 15) {
            ForEach(emojis, id: \.self) { emoji in
                Button(action: {
                    selectedEmoji = emoji
                    dismiss()
                }) {
                    ZStack {
                        Circle()
                            .fill(
                                selectedEmoji == emoji
                                    ? AnyShapeStyle(LinearGradient.primary)
                                    : AnyShapeStyle(Color.backgroundSecondaryShade2)
                            )
                        Text(emoji)
                            .font(.system(size: 30))
                        Circle()
                            .stroke(
                                selectedEmoji == emoji ? Color.backgroundSecondaryShade1 : .backgroundPrimaryShade2.opacity(0.3),
                                lineWidth: 2
                            )
                    }
                    .frame(width: 50, height: 50)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(20)
    }
 
    var body: some View {
        NavigationStack {
            ZStack {
                // Фон
                LinearGradient.pokerCloth
                .ignoresSafeArea()
                
                ScrollView {
                    emojiGrid
                }
            }
            .navigationTitle("CHOOSE AN AVATAR")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("DONE") {
                        dismiss()
                    }
                    .fontWeight(.bold)
                    .foregroundColor(.backgroundPrimaryShade1)
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    PokerEmojiPickerView(selectedEmoji: .constant("🃏"), emojis: ["♠️", "♣️", "♥️", "♦️", "🃏", "👑", "💰", "🏆", "🎲", "🫦", "🥃", "🚬", "💎", "💵", "🎰", "🎯", "⚡", "🔥", "💀", "₿"])
}
