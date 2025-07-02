//
//  MainView.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 02.07.25.
//

import Foundation
import SwiftUI


import SwiftUI

struct MainView: View {
    init() {
        // Setzt Hintergrundfarbe der Tab Bar (helles Grün z. B.)
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = UIColor(Color.calmGreen50)
        
        // Optional: Farbe nicht selektierter Items
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.calmGray500)
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }

    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            ActivitiesView()
                .tabItem {
                    Image(systemName: "figure.walk")
                    Text("Aktivitäten")
                }
            
            ReflectView()
                .tabItem {
                    Image(systemName: "apple.meditate")
                    Text("Reflexion")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "dollarsign.circle.fill")
                    Text("Spenden")
                }
        }
        .accentColor(.progressGreen) // Farbe für aktives Icon/Text
    }
}


struct ActivitiesView: View {
    var body: some View {
        Text("Aktivitäten")
            .font(.largeTitle)
            .foregroundColor(.gray)
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profil")
            .font(.largeTitle)
            .foregroundColor(.gray)
    }
}



#Preview {
    MainView()
}


