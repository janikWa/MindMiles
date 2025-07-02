//
//  MotivationCard.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 02.07.25.
//

import Foundation
import SwiftUI

func getRandomCards() -> [MotivationCard] {
    MotivationCategory.allCases.compactMap { category in
        motivationData[category]?.randomElement()
    }
}

struct MotivationCarousel: View {
    @State private var cards: [MotivationCard] = []

    var body: some View {
        VStack {
            if cards.isEmpty {
                Text("Lade Sprüche...")
                    .onAppear {
                        cards = getRandomCards()
                    }
            } else {
                TabView {
                    ForEach(cards, id: \.title) { card in
                        VStack(alignment: .leading, spacing: 12) {
                            Text(card.title)
                                .font(.headline)
                                .foregroundColor(.green)
                            Text(card.text)
                                .font(.body)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(16)
                        .shadow(radius: 4)
                        .padding(.horizontal, 20)
                    }
                }
                .frame(height: 180)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            }
        }
    }
}

// 3. Preview mit Beispielkarten
struct MotivationCarousel_Previews: PreviewProvider {
    static var previews: some View {
        MotivationCarousel()
    }
}
