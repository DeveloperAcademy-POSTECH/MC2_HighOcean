//
//  UNNotificationCenter.swift
//  HighOcean
//
//  Created by apple on 2023/05/12.
//

import Foundation
import UserNotifications

var notifivationBodies = [
    "띵동띵동",
    "떙떙떙떙떙",
    "따르르르르릉"
]

extension UNUserNotificationCenter {
    func scheduleNotification(by user: User) {
        let content = UNMutableNotificationContent()
        //    var dateComponents = DateComponents()
        //    dateComponents.weekday = selectedDays
        //    dateComponents.hour = 9
        //    dateComponents.minute = 0
        content.title = ""
        if let randomBody = notifivationBodies.randomElement() {
            content.body = randomBody
        }
        content.sound = UNNotificationSound.default
        
        let component = Calendar.current.dateComponents([.hour, .minute], from: user.time)
        let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: user.isAlarm)
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        self.add(request, withCompletionHandler: nil)
    }
}
