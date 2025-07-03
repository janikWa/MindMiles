//
//  ImprovementCard.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 03.07.25.
//

import Foundation
import SwiftUI

struct ImprovementCard: View {
    var wellbeingImprovement: Double
    

    var size: CGFloat = 200
    var strokeWidth: CGFloat = 12

    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 12) {
                Text("📈 Großartger Fortschritt! ")
                    .font(.headline)
                    .foregroundColor(Color.white)
                    .padding(.top, 16)
              
                

                Text("Du fühlst dich nach deinen Läufen um \(Int(wellbeingImprovement * 100)) % besser! 🌟")
                    .font(.body)
                    .foregroundColor(Color.white)
 
                
                    .padding(.bottom, 16)
     
            }
            
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.progressGreen.opacity(0.6))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
        
    }
}

#Preview {
    ImprovementCard(wellbeingImprovement: 0.8)
}


