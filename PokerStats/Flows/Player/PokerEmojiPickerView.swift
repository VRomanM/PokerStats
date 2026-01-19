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
                    Text(emoji)
                        .font(.system(size: 35))
                        .frame(width: 50, height: 50)
                        .background(
                            Circle()
                                .fill(
                                    selectedEmoji == emoji
                                        ? AnyShapeStyle(LinearGradient(
                                            colors: [Color(hex: "D4AF37"), Color(hex: "B8860B")],
                                            startPoint: .top,
                                            endPoint: .bottom
                                        ))
                                        : AnyShapeStyle(Color(hex: "1E2D2D"))
                                )
                        )
                        .overlay(
                            Circle()
                                .stroke(
                                    selectedEmoji == emoji ? Color.black : Color(hex: "8B7355").opacity(0.3),
                                    lineWidth: 2
                                )
                        )
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
                LinearGradient(
                    colors: [Color(hex: "0C1A1A"), Color(hex: "152424")],
                    startPoint: .top,
                    endPoint: .bottom
                )
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
                    .foregroundColor(Color(hex: "D4AF37"))
                }
            }
            .toolbarBackground(Color(hex: "0C1A1A"), for: .navigationBar)
            .preferredColorScheme(.dark)
        }
    }
}
