//
//  LoginView.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 06.07.25.
//

import Foundation

import SwiftUI

import SwiftUI

struct LoginView: View {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    @State private var email = ""

    var body: some View {
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

            VStack(spacing: 24) {

                // App Logo
                Image("LaunchLogo") // Replace "AppLogo" with your actual asset name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.top, 40)

                // Headline
                Text("Anmelden oder Registrieren")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 16)
                    .frame(maxWidth: .infinity, alignment: .center)

                // Email Field
                TextField("E-Mail-Adresse", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10)
                    .padding(.horizontal)

                // Continue Button
                Button(action: {
                    isLoggedIn = true
                }) {
                    Text("Weiter")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.progressGreen.opacity(0.6))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                }
                .padding(.horizontal)

                // OR Divider
                HStack {
                    Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.5))
                    Text("ODER")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Rectangle().frame(height: 1).foregroundColor(.gray.opacity(0.5))
                }
                .padding(.horizontal)

                // Apple
                VStack(spacing: 12) {
                    Button(action: {
                        // TODO: Handle Apple login
                    }) {
                        HStack {
                            Image(systemName: "applelogo")
                            Text("Mit Apple anmelden")
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }

                }
                .padding(.horizontal)

                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}

