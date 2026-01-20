//
//  PokerChip.swift
//  PokerStats
//
//  Created by Роман Вертячих on 19/01/2026.
//

import SwiftUI

//struct PokerChip: View {
//    var text: String
//    var action: () -> Void
//    var body: some View {
//        VStack(spacing: 0) {
//            // покерная фишка
//            VStack(spacing: 20) {
//                ZStack {
//                    // Внешний круг - покерная фишка
//                    Circle()
//                        .fill(
//                            LinearGradient.secondary
//                        )
//                        .frame(width: 150, height: 150)
//                        .shadow(color: .backgroundSecondaryShade1, radius: 10, x: 0, y: 5)
//                    
//                    // Внутренний круг
//                    Circle()
//                        .fill(Color.backgroundSecondaryShade3)
//                        .frame(width: 130, height: 130)
//                    
//                    // Emoji
//                    Text(text)
//                        .font(.system(size: 60))
//                }
//                .onTapGesture {
//                    action()
//                }
//            }
//        }
//    }
//}

struct PokerChip: View {
    let text: String
    let action: () -> Void
    @State private var rotation: Double = 0
    @State private var isAnimating = false
    @State private var gradientRotation: Double = 0
    
    var body: some View {
        Button(action: {
            guard !isAnimating else { return }
            isAnimating = true
            
            // Анимация градиента
            withAnimation(.linear(duration: 1.0)) {
                gradientRotation += 360
            }
            
            // Основное вращение фишки
            withAnimation(.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 0.3)) {
                rotation += 720
            }
            
            // Завершение анимации
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                isAnimating = false
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                action()
            }
            
            // Тактильная обратная связь
            let generator = UIImpactFeedbackGenerator(style: .medium)
            generator.impactOccurred()
        }) {
            ZStack {
                // Основной круг с вращающимся градиентом
                Circle()
                    .fill(
                        AngularGradient(
                            gradient: Gradient(colors: [
                                Color.backgroundPrimaryShade1,
                                Color.backgroundPrimaryShade2,
                                Color.backgroundPrimaryShade3,
                                Color.backgroundPrimaryShade1
                            ]),
                            center: .center,
                            startAngle: .degrees(gradientRotation),
                            endAngle: .degrees(gradientRotation + 360)
                        )
                    )
                    .frame(width: 150, height: 150)
                
                // Внутренняя часть фишки
                Circle()
                    .fill(Color.backgroundSecondaryShade1)
                    .frame(width: 130, height: 130)
                    .overlay(
                        // Декоративные элементы внутри фишки
                        ZStack {
                            // Концентрические круги
                            Circle()
                                .stroke(Color.backgroundPrimaryShade1.opacity(0.4), lineWidth: 2)
                                .frame(width: 120, height: 120)
                            
                            Circle()
                                .stroke(Color.backgroundPrimaryShade3.opacity(0.3), lineWidth: 1)
                                .frame(width: 110, height: 110)
                            
                            // Центральный круг
                            Circle()
                                .fill(Color.backgroundSecondaryShade2)
                                .frame(width: 80, height: 80)
                            
                            // Emoji
                            Text(text)
                                .font(.system(size: 45))
                                .shadow(color: .black.opacity(0.2), radius: 2, x: 1, y: 1)
                        }
                    )
                
                // Обводка фишки
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color.backgroundPrimaryShade1,
                                Color.backgroundPrimaryShade3,
                                Color.backgroundPrimaryShade2,
                                Color.backgroundPrimaryShade1
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 8
                    )
                    .frame(width: 150, height: 150)
                    .shadow(color: Color.backgroundPrimaryShade1.opacity(0.3), radius: 5, x: 0, y: 0)
                
                // 3D эффект - свет и тень
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.15),
                                Color.clear,
                                Color.black.opacity(0.15)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2
                    )
                    .frame(width: 152, height: 152)
            }
            // 3D вращение всей фишки
            .rotation3DEffect(
                .degrees(rotation),
                axis: (x: 0, y: 1, z: 0.05), // Небольшой наклон по Z для более естественного вращения
                anchor: .center,
                anchorZ: 0,
                perspective: 0.4
            )
            // Внешняя тень (не вращается)
            .shadow(color: .black.opacity(0.5), radius: 15, x: 0, y: 10)
            .overlay(
                // Подсказка для пользователя
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(Color.backgroundSecondaryShade1)
                                .frame(width: 35, height: 35)
                                .shadow(color: .black.opacity(0.3), radius: 3, x: 1, y: 1)
                            
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.backgroundPrimaryShade1)
                                .rotationEffect(.degrees(isAnimating ? 180 : 0))
                                .animation(isAnimating ? Animation.linear(duration: 0.5).repeatCount(1, autoreverses: false) : .default, value: isAnimating)
                        }
                        .offset(x: -10, y: -10)
                    }
                }
                .frame(width: 150, height: 150)
            )
        }
        .buttonStyle(PlainButtonStyle())
        .disabled(isAnimating)
    }
}

#Preview {
    PokerChip(text: "💰", action: {})
}
