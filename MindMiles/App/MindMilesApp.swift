//
//  MindMilesApp.swift
//  MindMiles
//
//  Created by Janik Wahrheit on 01.07.25.
//

import SwiftUI

@main
struct MindMilesApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    var body: some Scene {
        WindowGroup {
            //if isLoggedIn {
                    MainView()
              //  } else {
                 //   LoginView()
                //}
        }
    }
}
