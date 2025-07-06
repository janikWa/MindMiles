//
//  ActivitiesView.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 04.07.25.
//

import Foundation
import SwiftUI

struct ActivitiesView: View {
    
    // Beispiel-Daten
    struct Activity: Identifiable {
        let id = UUID()
        let type: String
        let date: Date
        let duration: Int // Minuten
    }
    
    let pastActivities: [Activity] = [
        Activity(type: "Laufen", date: Date(), duration: 30),
        Activity(type: "Spazieren", date: Date().addingTimeInterval(-86400), duration: 20),
        Activity(type: "Meditation", date: Date().addingTimeInterval(-172800), duration: 15)
    ]
    
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

                ScrollView {
                    VStack(spacing: 24) {
                        
                        // Titel
                        VStack(alignment: .leading, spacing: 4) {
                            Text("🏃🏻‍♂️ Aktivitäten")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 16)
                        
                        NavigationLink(destination: ActivityTrackingView()) {
                                    HStack {
                                        Image(systemName: "plus.circle.fill")
                                        Text("Neue Aktivität starten")
                                            .fontWeight(.semibold)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.progressGreen.opacity(0.6))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                                }
                                .padding(.horizontal)
                        

                        // Vergangene Aktivitäten
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Vergangene Aktivitäten")
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding(.horizontal)

                            ForEach(pastActivities) { activity in
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(activity.type)
                                            .font(.headline)
                                        Text(formattedDate(activity.date))
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Text("\(activity.duration) Min")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .background(Color.white.opacity(0.5))
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.1), radius: 2)
                                .padding(.horizontal)
                    
                            }
                        }
                    }
                    .padding(.bottom, 32)
                }
            }
            .navigationBarHidden(true)
        }
    }
    
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

#Preview {
    ActivitiesView()
}


