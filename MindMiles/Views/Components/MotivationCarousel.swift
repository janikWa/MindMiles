//
//  MotivationCard.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 02.07.25.
//

import Foundation
import SwiftUI

func getRandomCards() -> [MotivationCardWithCategory] {
    MotivationCategory.allCases.compactMap { category in
        guard let card = motivationData[category]?.randomElement() else { return nil }
        return MotivationCardWithCategory(category: category, card: card)
    }
}

struct MotivationCarousel: View {
    @State private var cards: [MotivationCardWithCategory] = []
    @State private var currentIndex = 0

    var body: some View {
        VStack {
            if cards.isEmpty {
                Text("Lade Sprüche...")
                    .onAppear {
                        cards = getRandomCards()
                    }
            } else {
                TabView(selection: $currentIndex) {
                    ForEach(Array(cards.enumerated()), id: \.element.id) { index, item in
                        VStack(alignment: .leading, spacing: 12) {
                            Text("\(item.category.emoji) \(item.card.title)")
                                .font(.headline)
                                .foregroundColor(.green)

                            Text(item.card.text)
                                .font(.body)
                                .foregroundColor(.gray)
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)

                            Spacer()

                            // Pagination Punkte
                            HStack(spacing: 6) {
                                ForEach(0..<cards.count, id: \.self) { i in
                                    Circle()
                                        .fill(i == currentIndex ? Color.gray.opacity(0.7) : Color.gray.opacity(0.3))
                                        .frame(width: 8, height: 8)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.bottom, 8)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 200, alignment: .topLeading)
                        .background(Color.white.opacity(0.5))
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 220)  // etwas größer, damit Punkte Platz haben
            }
        }
    }
}

// 6. Preview
struct MotivationCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MotivationCarousel()
    }
}
