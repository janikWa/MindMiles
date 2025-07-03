//
//  FeedbackView.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 02.07.25.
//

import Foundation
import SwiftUI


struct ReflectView: View {
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
                            Text("🧘 Reflexion ")
                                .font(.title)
                                .fontWeight(.bold)

                        }
                        .padding([.top, .leading, .trailing], 16)
                        .frame(maxWidth: .infinity, alignment: .leading)

        
                        ImprovementCard(wellbeingImprovement: 0.35)
                            .padding(.horizontal, 16)
                        
                        MoodChartView()
                            .padding(.horizontal, 16)
  
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    ReflectView()
}
