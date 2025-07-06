//
//  DashboardView.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 02.07.25.
//

import Foundation
import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.white,
                        Color.calmGreen50,
                        Color.calmOrange50
                   ]),
                    startPoint: .topLeading,
                   endPoint: .bottomTrailing
                )
               .ignoresSafeArea()

                ScrollView { // Hier die ScrollView
                   VStack(alignment: .leading, spacing: 16) {
                        // Begrüßung
                       VStack(alignment: .leading, spacing: 4) {
                            Text("👋 Hallo!")
                                .font(.title)
                               .fontWeight(.bold)

                            Text("Willkommen zurück!")
                                .font(.subheadline)
                                .foregroundColor(Color.gray)
                        }
                        .padding([.top, .leading, .trailing], 16)
                        .frame(maxWidth: .infinity, alignment: .leading)

                        ProgressCardView(distance: 43, goal: 80)
                           .padding(.horizontal, 16)

                        WeeklyStatsCardView(weeklyGoal: 100, dailyDistances: [10, 12, 8, 0, 7, 12, 24])
                           .padding(.horizontal, 16)
                        
                        MotivationCarousel()
                           .padding(.horizontal, 16)

                       Spacer(minLength: 20)
                   }
                }
            }
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    DashboardView()
}
