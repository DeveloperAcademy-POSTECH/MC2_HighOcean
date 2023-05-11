//
//  HighOceanApp.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI

@main
struct HighOceanApp: App {
    var body: some Scene {
        WindowGroup {
            if let savedSettingsData = UserDefaults.standard.data(forKey: "User"),
               let savedUser = try? JSONDecoder().decode(User.self, from: savedSettingsData) {
                NavigationView {
                    HomeView(user: savedUser)
                }
                .accentColor(Color("Accent"))
            } else {
                NavigationView {
                    ProfileView()
                }
            }
        }
    }
}
