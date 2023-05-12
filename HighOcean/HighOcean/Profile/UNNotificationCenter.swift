//
//  UNNotificationCenter.swift
//  HighOcean
//
//  Created by apple on 2023/05/12.
//

import Foundation
import UserNotifications
import UIKit



var notifivationChildBodies = [
    "마음은 어때? 글로 표현해 볼까? -왈왈이가",
    "오늘은 어떤 일이 있었니? 궁금해!",
    "부모님이 오늘 야근을 하신다고 전해달래.. 기다리면서 간단한 선물을 준비해 볼까?",
    "부모님이 오늘 좀 늦을 거 같다멍! 심심하면 나랑 같이 카드를 적어봐멍!",
]


var notifivationParentBodies = [
    "의젓하게 부모님을 기다렸을 아이를 위한 메세지를 남겨주세요.",
    "당신의 애정을 아이에게 표현해 주세요. 갑작스러웠을 공백을 채워줄 거예요.",
    "마음을 듬뿍 담은 카드가 방금 막 도착했어요.",
    "하루가 너무 빨리 가지 않나요? 오늘의 사랑을 담은 카드를 전해주세요.",
]

extension UNUserNotificationCenter {
    func addNotificationRequest(by week: Int, time: Date, isAlarm: Bool, userRole: String) -> String{
        let content = UNMutableNotificationContent()
        content.title = "우리 마음포카 보러갈까?"
        
        if userRole == "부모" {
            if let randomBody = notifivationParentBodies.randomElement() {
                content.body = randomBody
            }
        } else {
            if let randomBody = notifivationChildBodies.randomElement() {
                content.body = randomBody
            }
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
