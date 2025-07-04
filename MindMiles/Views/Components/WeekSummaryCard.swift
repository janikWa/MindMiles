//
//  WeekSummaryCard.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 03.07.25.
//

import Foundation
import SwiftUI


struct WeekSummaryCard: View {
    
    var moodImprovement : Double
    var activitiesCount :  Int
    var longestActivity : Int
    
    var body: some View{
        VStack(alignment: .center, spacing: 16){
            
            VStack(alignment: .leading, spacing: 12){
                Text("Wochenübersicht")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal)
            }
            
            HStack(alignment: .center, spacing: 16){
               
                Spacer()
                summaryItem(
                    systemImage: "figure.run",
                    value: "\(activitiesCount)",
                    label: "Aktivitäten",
                    color: "gray"
                )
                
                Spacer()
                summaryItem(
                    systemImage: moodImprovement >= 0 ? "arrow.up" : "arrow.down",
                    value: String(format: "%.1f", abs(moodImprovement)),
                    label: "Stimmungs-\nverbesserung",
                    color: moodImprovement >= 0 ? "green" : "orange"
                )
                
                Spacer()
                summaryItem(
                    systemImage: "hourglass",
                    value: "\(longestActivity) Min",
                    label: "Längste\nAktivität",
                    color: "gray"
                )
                Spacer()
                
            }
            
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.opacity(0.5))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)

    }
    
    
    private func summaryItem(systemImage: String, value: String, label: String, color: String) -> some View {
        
        let foregroundColor: Color
        let backgroundColor: Color

        switch color {
        case "green":
            foregroundColor = Color.progressGreen
            backgroundColor = Color.calmGreen50
        case "orange":
            foregroundColor = Color.progressOrange
            backgroundColor = Color.calmOrange50
        case "gray":
            foregroundColor = .gray
            backgroundColor = Color.calmGray100
        default:
            foregroundColor = .primary
            backgroundColor = Color(UIColor.systemGray5)
        }

        return VStack(spacing: 4) {
            ZStack {
                Circle()
                    .fill(backgroundColor)
                    .frame(width: 50, height: 50)
                    .padding(.vertical, 8)

                Image(systemName: systemImage)
                    .font(.headline)
                    .foregroundColor(foregroundColor)
            }

            Text(value)
                .font(.headline)

            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .frame(height: 40)
        }.padding(.bottom, 16)
    }

}

#Preview{
    WeekSummaryCard(moodImprovement: -0.8, activitiesCount: 6, longestActivity: 31)
}
