//
//  HighOceanApp.swift
//  HighOcean
//
//  Created by apple on 2023/05/03.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self

        let options: UNAuthorizationOptions = [.badge, .sound, .alert]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { granted, error in
            if granted {
                print("User Notification 권한이 부여되었습니다.")
            } else {
                print("User Notification 권한이 거부되었습니다.")
            }
        }

        application.registerForRemoteNotifications()

        return true
    }
}


@main
struct HighOceanApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            if let savedSettingsData = UserDefaults.standard.data(forKey: "User"),
               let savedUser = try? JSONDecoder().decode(User.self, from: savedSettingsData) {
                HomeView(user: savedUser)
            } else {
                NavigationView {
                    ProfileView()
                }
            }
        }
    }
}
