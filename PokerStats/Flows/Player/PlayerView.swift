//
//  PlayerView.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI
import SwiftData

struct PlayerView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var players: [Player]
    
    @State private var nickname: String = ""
    @State private var surname: String = ""
    @State private var name: String = ""
    @State private var gender: Gender = .male
    @State private var selectedEmoji: String = "♠️"
    @State private var isEmojiPickerPresented = false
    @State private var showSaveConfirmation = false
    
    let pokerEmojis = ["♠️", "♣️", "♥️", "♦️", "🃏", "👑", "💰", "🏆", "🎲", "🫦", "🥃", "🚬", "💎", "💵", "🎰", "🎯", "⚡", "🔥", "💀", "₿"]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient.pokerCloth
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 0) {
                        // Аватарка в стиле покерной фишки
                        PokerChip(text: selectedEmoji) {
                            isEmojiPickerPresented.toggle()
                        }
                        .padding(.top, 30)
                        .padding(.bottom, 40)
                        
                        // Карточка с информацией
                        VStack(spacing: 25) {
                            // Заголовок карточки
                            HStack {
                                Image(systemName: "person.text.rectangle.fill")
                                    .foregroundColor(.backgroundPrimaryShade1)
                                Text("Player Information")
                                    .font(.headline)
                                    .foregroundColor(.backgroundPrimaryShade1)
                                Spacer()
                            }
                            .padding(.horizontal)
                            .padding(.top, 20)
                            
                            // Поля ввода
                            VStack(spacing: 25) {
                                // Никнейм
                                PokerTextField(
                                    title: "Nickname".localized(),
                                    placeholder: "Enter nickname".localized(),
                                    text: $nickname,
                                    icon: "person.fill"
                                )
                                
                                // Фамилия
                                PokerTextField(
                                    title: "Surname".localized(),
                                    placeholder: "Optional".localized(),
                                    text: $surname,
                                    icon: "signature"
                                )
                                
                                // Имя
                                PokerTextField(
                                    title: "Name".localized(),
                                    placeholder: "Optional".localized(),
                                    text: $name,
                                    icon: "person.crop.circle"
                                )
                                
                                // Пол
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack {
                                        Image(systemName: "person.2.fill")
                                            .foregroundColor(.backgroundPrimaryShade1)
                                        Text("Gender")
                                            .font(.caption)
                                            .fontWeight(.bold)
                                            .foregroundColor(.backgroundPrimaryShade1)
                                    }
                                    
                                    HStack(spacing: 15) {
                                        PokerButton(
                                            title: "MALE".localized(),
                                            icon: "mustache.fill",
                                            fontSize: .small,
                                            isSelected: gender == .male,
                                            action: { gender = .male }
                                        )
                                        
                                        PokerButton(
                                            title: "FEMALE".localized(),
                                            icon: "mouth.fill",
                                            fontSize: .small,
                                            isSelected: gender == .female,
                                            action: { gender = .female }
                                        )
                                        
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                            // Кнопка сохранения
                            PokerButton(
                                title: "SAVE".localized(),
                                icon: "checkmark.circle.fill",
                                action: savePlayer
                            )
                            .padding(.horizontal)
                            .padding(.top, 10)
                            .padding(.bottom, 30)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(
                                    LinearGradient.pokerClothReverse
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(
                                            LinearGradient.border,
                                            lineWidth: 1
                                        )
                                )
                                .shadow(color: .backgroundSecondaryShade1.opacity(0.3), radius: 15, x: 0, y: 5)
                        )
                        .padding(.horizontal, 20)
                        .padding(.bottom, 40)
                    }
                }
                
                // Конфирмация сохранения
                if showSaveConfirmation {
                    InformationAlertView(title: "PROFILE SAVED".localized(), message: "Good luck at the table!".localized())
                        .transition(.scale.combined(with: .opacity))
                }
            }
            .navigationTitle("PLAYER PROFILE")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "suit.spade.fill")
                        .foregroundColor(.backgroundPrimaryShade1)
                }
            }
            .sheet(isPresented: $isEmojiPickerPresented) {
                PokerEmojiPickerView(selectedEmoji: $selectedEmoji, emojis: pokerEmojis)
            }
            .onAppear {
                loadExistingPlayer()
            }
            .preferredColorScheme(.dark)
        }
    }
    
    private func loadExistingPlayer() {
        if let existingPlayer = players.first {
            nickname = existingPlayer.nickname
            surname = existingPlayer.surname ?? ""
            name = existingPlayer.name ?? ""
            gender = existingPlayer.gender
            selectedEmoji = existingPlayer.avatar ?? "♠️"
        }
    }
    
    private func savePlayer() {
        players.forEach { modelContext.delete($0) }
        
        let newPlayer = Player(
            nickname: nickname.isEmpty ? "Player".localized() : nickname,
            avatar: selectedEmoji,
            surname: surname.isEmpty ? nil : surname,
            name: name.isEmpty ? nil : name,
            gender: gender
        )
        
        modelContext.insert(newPlayer)
        
        do {
            try modelContext.save()
            
            // Тактильная обратная связь
            let generator = UIImpactFeedbackGenerator(style: .heavy)
            generator.impactOccurred()
            
            // Показываем конфирмацию
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                showSaveConfirmation = true
            }
            
            // Скрываем через 2 секунды
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    showSaveConfirmation = false
                }
            }
        } catch {
            print("Saving error: \(error)")
        }
    }
}

// MARK: - Preview

#Preview {
    PlayerView()
        .modelContainer(for: Player.self, inMemory: true)
}
