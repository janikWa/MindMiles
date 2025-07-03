//
//  WeekCardView.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 02.07.25.
//

import Foundation
import SwiftUI

extension Double {
    func toFixed(_ places: Int) -> String {
        return String(format: "%." + String(places) + "f", self)
    }
}
// --- Ende Color Extension und Double Extension ---

struct DailyProgress: Identifiable {
    let id = UUID()
    let day: String
    let distance: Double
    let completed: Bool
    var simulatedHeight: Double // Muss 'var' sein

    var gradientColors: [Color] {
        if completed {
            return [Color.progressGreen, Color.calmGreen300]
        } else {
            return [Color.progressOrange, Color.calmOrange200]
        }
    }
}

struct WeeklyStatsCardView: View {

    var rawDailyDistances: [Double]

    // Wochenziel, das jetzt von außen übergeben wird
    let weeklyGoal: Double

    // Tägliches Ziel, das aus dem Wochenziel berechnet wird (Computed Property)
    var dailyGoal: Double {
        // Sicherstellen, dass wir nicht durch Null teilen, falls daysOfWeek leer sein sollte
        guard !daysOfWeek.isEmpty else { return 0.0 }
        return weeklyGoal / Double(daysOfWeek.count)
    }
    
    private let daysOfWeek = ["Mo", "Di", "Mi", "Do", "Fr", "Sa", "So"]

  
    @State private var animatedWeeklyData: [DailyProgress] = []


    init(weeklyGoal: Double, dailyDistances: [Double] = []) {
            self.weeklyGoal = weeklyGoal
            self.rawDailyDistances = dailyDistances
            
            let calculatedDailyGoal = weeklyGoal / Double(daysOfWeek.count)
            _animatedWeeklyData = State(initialValue: Self.transformRawData(dailyDistances, dailyGoal: calculatedDailyGoal))
        }
    
 
    private static func transformRawData(_ distances: [Double], dailyGoal: Double) -> [DailyProgress] {
        let daysOfWeek = ["Mo", "Di", "Mi", "Do", "Fr", "Sa", "So"]
        return distances.enumerated().map { (index, distance) in
            let day = daysOfWeek[index]
            let completed = distance >= dailyGoal
            return DailyProgress(day: day, distance: distance, completed: completed, simulatedHeight: 0)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            Text("Diese Woche")
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.vertical,16)

            HStack(alignment: .bottom, spacing: 8) {
                ForEach(animatedWeeklyData.indices, id: \.self) { index in
                    let dayData = animatedWeeklyData[index]
                    
                    VStack(spacing: 4) {
                        ZStack(alignment: .bottom) {
                            Capsule()
                                .fill(Color.calmGray100)
                                .frame(width: 24, height: 100)

                            Capsule()
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: dayData.gradientColors),
                                        startPoint: .bottom,
                                        endPoint: .top
                                    )
                                )
                                .frame(width: 24, height: dayData.simulatedHeight)
                                .animation(.easeOut(duration: 0.7).delay(Double(index) * 0.1), value: dayData.simulatedHeight)

                            if dayData.completed {
                                Text("✓")
                                    .font(.caption)
                                    .foregroundColor(.white)
                                    .offset(y: -dayData.simulatedHeight + 12)
                            }
                        }
                        
                        Text(dayData.day)
                            .font(.caption)
                            .fontWeight(.medium)
                            .foregroundColor(.calmGray600)
                            .padding(.top, 4)
                        
                        Text("\(dayData.distance.toFixed(1))km")
                            .font(.caption2)
                            .foregroundColor(.calmGray500)
                            .padding(.top, 2)
                    }
                }
            }
            .padding(.vertical, 16)
    

            Text("Tägliches Ziel: \(dailyGoal.toFixed(1))km")
                .font(.subheadline)
                .foregroundColor(.calmGray600)
                .padding(.bottom, 16)
                .multilineTextAlignment(.center)

        }
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.5))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)

        .onAppear {
            // Setze die Höhen für die Animation
            animateBars()
        }
        // WICHTIG: Beobachte Änderungen an rawDailyDistances, um die Animation neu zu starten
        .onChange(of: rawDailyDistances) { newRawDistances in
            // Re-initialisiere animatedWeeklyData und starte die Animation neu
            animatedWeeklyData = Self.transformRawData(newRawDistances, dailyGoal: dailyGoal)
            animateBars()
        }
    }

    // Hilfsfunktion zum Auslösen der Animationen
    private func animateBars() {
        for i in animatedWeeklyData.indices {
            let maxBarHeight: Double = 100
   
            let normalizedDistance = min(rawDailyDistances[i], 3.0) // Nutze rawDailyDistances hier
            let targetHeight = (normalizedDistance / 3.0) * maxBarHeight
            
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.1) {
                // Zugriff über den Index, da animatedWeeklyData @State ist
                animatedWeeklyData[i].simulatedHeight = targetHeight
            }
        }
    }
}



#Preview {
    WeeklyStatsCardView(weeklyGoal: 70, dailyDistances:  [10,12, 8, 0, 7, 12, 24])
}


