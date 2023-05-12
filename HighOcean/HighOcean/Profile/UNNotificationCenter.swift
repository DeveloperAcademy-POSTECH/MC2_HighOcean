//
//  UNNotificationCenter.swift
//  HighOcean
//
//  Created by apple on 2023/05/12.
//

import Foundation
import UserNotifications
import UIKit

var notifivationBodies = [
    "띵동띵동",
    "떙떙떙떙떙",
    "따르르르르릉"
]

extension UNUserNotificationCenter {
    func addNotificationRequest(by week: Int, time: Date, isAlarm: Bool) -> String{
        let content = UNMutableNotificationContent()
        content.title = ""
        if let randomBody = notifivationBodies.randomElement() {
            content.body = randomBody
        }
        content.sound = UNNotificationSound.default

        var component = Calendar.current.dateComponents([.hour, .minute], from: time)
        component.weekday = week
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: isAlarm)
        let id = UUID().uuidString
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        
        self.add(request, withCompletionHandler: nil)
        return id
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

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
