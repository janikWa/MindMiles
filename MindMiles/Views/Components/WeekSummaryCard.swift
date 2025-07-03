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
            }
            
            HStack(alignment: .center, spacing: 16){
                
            }
            
        }
    }
}

#Preview{
    WeekSummaryCard(moodImprovement: 1.4, activitiesCount: 6, longestActivity: 31)
}
