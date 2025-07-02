//
//  ProgressView.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 02.07.25.
//

import SwiftUI

struct ProgressCardView: View {
    var distance: Double // Die bereits zurückgelegte Distanz (z.B. 8.0)
    var goal: Double     // Das Gesamtziel (z.B. 12.0)
    
    // @State für die Animation des Fortschritts
    @State private var animatedProgress: Double = 0.0
    
    // Berechneter Fortschritt als Double (0.0 - 1.0)
    var progressFraction: Double {
        min(1.0, distance / goal)
    }
    
    // Berechneter Fortschritt in Prozent (0 - 100)
    var progressPercentage: Int {
        Int(animatedProgress * 100) // Nutzt den animierten Wert für die Anzeige
    }

    // Standardwerte für Größe und Strichstärke, wie in React
    var size: CGFloat = 200
    var strokeWidth: CGFloat = 12

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            // Oberer Teil: Titel und Zielinformationen
            VStack(alignment: .center, spacing: 10) {
                Text("Deine Woche im Überblick")
                    .font(.headline)
                    .fontWeight(.bold)

                Text("Ziel: \(String(format: "%.0f", goal)) km • noch \(String(format: "%.0f", max(0, goal - distance))) km bis Sonntag")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 16)
            .padding(.top, 16)
            .padding(.horizontal, 16)

            // Mittlerer Teil: Der Fortschrittskreis
            ZStack {
                // Hintergrundkreis
                Circle()
                    .stroke(Color.calmGray200, lineWidth: strokeWidth)

                
                Circle()
                    .trim(from: 0, to: animatedProgress)
                    .stroke(
                        LinearGradient( 
                            gradient: Gradient(colors: [Color.progressGreen, Color.progressOrange]),
                            startPoint: .topLeading, // Entspricht x1="0%" y1="0%"
                            endPoint: .bottomTrailing // Entspricht x2="100%" y2="100%"
                        ),
                        style: StrokeStyle(lineWidth: strokeWidth, lineCap: .round) // lineCap für runde Enden
                    )
                    .rotationEffect(.degrees(-90)) // Startet oben
                    .animation(.easeOut(duration: 1.0), value: animatedProgress) // Animation

                // Texte im Kreis
                VStack(spacing: 4) {
                    Text("\(progressPercentage)%")
                        .font(.custom("YourFont", size: 30)) // Ähnlich wie text-3xl
                        .fontWeight(.bold)
                        .foregroundColor(.calmGray800)
                        .lineLimit(1) // Verhindert Umbruch bei sehr großen Prozentzahlen

                    Text("\(String(format: "%.0f", distance)) von \(String(format: "%.0f", goal)) km")
                        .font(.subheadline) // Ähnlich wie text-sm
                        .foregroundColor(.calmGray600)
                        .lineLimit(1)

                    Text(progressPercentage >= 100 ? "🎉 Geschafft!" : "💪 Du schaffst das!")
                        .font(.caption) // Ähnlich wie text-xs
                        .foregroundColor(.calmGray500)
                        .padding(.top, 4) // Ähnlich wie mt-2
                }
            }
            .frame(width: size, height: size)
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .onAppear {
                // Verzögerung der Animation wie im React useEffect
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    animatedProgress = progressFraction // Setze den Zielwert nach der Verzögerung
                }
            }

           
            HStack(spacing: 0) { // spacing: 0, um die Spacer die Kontrolle zu überlassen
                            Spacer(minLength: 0) // Minimale Länge auf 0 setzen, um maximalen Rand zu erlauben

                            VStack(alignment: .center, spacing: 4) { // alignment .center für Zahlen und Text
                                HStack(alignment: .lastTextBaseline, spacing: 2) { // HStack für Zahl und "km"
                                    Text("\(String(format: "%.0f", distance))") // Nur die Zahl ist farbig
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.progressGreen) // Grüne Farbe für die Zahl
                                    
                                    Text("km") // "km" ist grau und kleiner
                                        .font(.footnote) // Kleinere Schriftgröße
                                        .foregroundColor(.secondary) // Graue Farbe
                                }
                                
                                Text("Geschafft") // Der Text steht direkt darunter
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }

                            Spacer() // Dieser Spacer sorgt für den Abstand zwischen den beiden Spalten

                            VStack(alignment: .center, spacing: 4) { // alignment .center für Zahlen und Text
                                HStack(alignment: .lastTextBaseline, spacing: 2) { // HStack für Zahl und "km"
                                    Text("\(String(format: "%.0f", max(0, goal - distance)))") // Nur die Zahl ist farbig
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.progressOrange) // Orange Farbe für die Zahl
                                    
                                    Text("km") // "km" ist grau und kleiner
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                                
                                Text("Noch zu gehen") // Der Text steht direkt darunter
                                    .font(.footnote)
                                    .foregroundColor(.secondary)
                            }
                            
                            Spacer(minLength: 0) // Minimale Länge auf 0 setzen
                        }
                        .padding(.horizontal, -128) // Padding bleibt für den gesamten Hstack
                        .padding(.bottom, 16)
        }
        .background(Color.white.opacity(0.5))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        
    }
}

#Preview {
    ProgressCardView(distance: 30, goal: 80)
}

