//
//  MoodChart.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 03.07.25.
//

import Foundation
import SwiftUI
import Charts

struct MoodData: Identifiable {
    let id = UUID() // For SwiftUI List/ForEach
    let date: String
    let mood: Double // Use Double for average moods
}


struct MoodChartView: View {
    @State private var selectedTimeRange: String = "week"

    let moodDataWeek: [MoodData] = [
        .init(date: "Mo", mood: 3),
        .init(date: "Di", mood: 4),
        .init(date: "Mi", mood: 3),
        .init(date: "Do", mood: 4),
        .init(date: "Fr", mood: 3),
        .init(date: "Sa", mood: 2),
        .init(date: "So", mood: 4),
    ]

    let moodData12Weeks: [MoodData] = [
        .init(date: "KW 40", mood: 2.5),
        .init(date: "KW 42", mood: 2.8),
        .init(date: "KW 44", mood: 3.1),
        .init(date: "KW 46", mood: 3.3),
        .init(date: "KW 48", mood: 3.0),
        .init(date: "KW 50", mood: 3.5),
        .init(date: "KW 52", mood: 3.8),
        .init(date: "KW 2", mood: 3.6),
        .init(date: "KW 4", mood: 3.9),
        .init(date: "KW 6", mood: 3.7),
        .init(date: "KW 8", mood: 4.0),
        .init(date: "KW 10", mood: 3.8),
    ]

    let moodData12Months: [MoodData] = [
        .init(date: "Feb", mood: 2.2),
        .init(date: "Mär", mood: 2.5),
        .init(date: "Apr", mood: 2.8),
        .init(date: "Mai", mood: 3.0),
        .init(date: "Jun", mood: 3.2),
        .init(date: "Jul", mood: 3.4),
        .init(date: "Aug", mood: 3.6),
        .init(date: "Sep", mood: 3.5),
        .init(date: "Okt", mood: 3.8),
        .init(date: "Nov", mood: 3.7),
        .init(date: "Dez", mood: 3.9),
        .init(date: "Jan", mood: 3.8),
    ]

    var currentMoodData: [MoodData] {
        switch selectedTimeRange {
        case "week":
            return moodDataWeek
        case "12weeks":
            return moodData12Weeks
        case "12months":
            return moodData12Months
        default:
            return moodDataWeek
        }
    }

    func moodEmoji(for value: Double) -> String {
        switch Int(value.rounded()) {
        case 1: return "😕" // Müde
        case 2: return "😐" // Okay
        case 3: return "🙂" // Gut
        case 4: return "😄" // Fantastisch
        default: return ""
        }
    }

    var body: some View {
        VStack {
            Picker("Time Range", selection: $selectedTimeRange) {
                Text("Diese Woche").tag("week")
                Text("12 Wochen").tag("12weeks")
                Text("12 Monate").tag("12months")
            }
            .pickerStyle(.segmented)
            .padding()

            Chart {
                ForEach(currentMoodData) { dataPoint in
                    // Die gefüllte Fläche
                    AreaMark(
                        x: .value("Date", dataPoint.date),
                        y: .value("Mood", dataPoint.mood)
                    )
                    .interpolationMethod(.monotone)
                    .foregroundStyle(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.calmGreen300.opacity(0.8),
                                Color.calmGreen400.opacity(0.1)
                            ]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )

                    // Die Linie darüber
                    LineMark(
                        x: .value("Date", dataPoint.date),
                        y: .value("Mood", dataPoint.mood)
                    )
                    .interpolationMethod(.monotone)
                    .lineStyle(StrokeStyle(lineWidth: 3))
                    .foregroundStyle(Color.progressGreen)

                    // Punkte auf der Linie
                    PointMark(
                        x: .value("Date", dataPoint.date),
                        y: .value("Mood", dataPoint.mood)
                    )
                    .foregroundStyle(Color.progressGreen)
                }
            }

            .chartYScale(domain: [0, 4])
            .chartYAxis {
                AxisMarks(values: [1, 2, 3, 4]) { value in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel {
                        if let moodValue = value.as(Int.self) {
                            Text(moodEmoji(for: Double(moodValue)))
                        }
                    }
                }
            }
            .chartXAxis {
                AxisMarks { value in
                    AxisGridLine()
                    AxisTick()
                    AxisValueLabel()
                }
            }
            .frame(height: 200)
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.5))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
    }
}

#Preview {
    MoodChartView()
}
