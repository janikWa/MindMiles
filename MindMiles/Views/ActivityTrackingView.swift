//
//  ActivityTrackingView.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 04.07.25.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct ActivityTrackingView: View {
    
    @State private var isTracking = false
    @State private var timeElapsed: TimeInterval = 0
    @State private var distance: Double = 0
    
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.calmGreen50, Color.calmOrange50]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 32) {
                Text("Aktivität auszeichnen")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 40)

                // Großer animierter Kreis
                ZStack {
                    Circle()
                        .fill(Color.progressGreen.opacity(0.2))
                        .frame(width: 200, height: 200)
                    
                    if isTracking {
                        Circle()
                            .stroke(Color.progressGreen, lineWidth: 4)
                            .frame(width: 160, height: 160)
                            .scaleEffect(isTracking ? 1.05 : 1.0)
                            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: isTracking)
                    }

                    VStack {
                        Text(timeString(from: timeElapsed))
                            .font(.largeTitle)
                            .monospacedDigit()
                        Text("\(String(format: "%.2f", distance)) km")
                            .font(.headline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.top, 16)

                // Buttons
                if isTracking {
                    HStack(spacing: 24) {
                        Button(action: pauseTracking) {
                            Label("Pause", systemImage: "pause.circle.fill")
                                .frame(width: 120, height: 44)
                                .background(Color.calmGray100)
                                .foregroundColor(.primary)
                                .cornerRadius(10)
                        }
                        Button(action: stopTracking) {
                            Label("Beenden", systemImage: "stop.circle.fill")
                                .frame(width: 120, height: 44)
                                .background(Color.progressOrange)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                } else {
                    Button(action: startTracking) {
                        Label("Starten", systemImage: "play.circle.fill")
                            .frame(width: 200, height: 50)
                            .background(Color.progressGreen)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    // MARK: - Hilfsmethoden
    
    func startTracking() {
        isTracking = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            timeElapsed += 1
            distance += 0.01 // ⬅️ Simuliert 10m/Sekunde – später mit GPS ersetzen
        }
    }
    
    func pauseTracking() {
        timer?.invalidate()
        timer = nil
        isTracking = false
    }
    
    func stopTracking() {
        timer?.invalidate()
        timer = nil
        isTracking = false
        // ⬇️ Hier speichern (z. B. in Core Data oder Datei)
        print("Aktivität gespeichert: \(distance) km in \(timeElapsed) Sekunden")
        // Reset
        timeElapsed = 0
        distance = 0
    }
    
    func timeString(from interval: TimeInterval) -> String {
        let minutes = Int(interval) / 60
        let seconds = Int(interval) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}


#Preview{
    ActivityTrackingView()
}
