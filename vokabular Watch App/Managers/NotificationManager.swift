//
//  NotificationManager.swift
//  vokabular
//
//  Created by malva on 13/01/25.
//

import SwiftUI
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()
    
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                self.scheduleNotifications()
            }
        }
    }
    
    func scheduleNotifications() {
        let content = UNMutableNotificationContent()
        content.title = "Time to learn a new word!"
        
        // Random word selection for notification
        if let language = Language.allCases.randomElement(),
           let word = WordDatabase.shared.getRandomWord(for: language) {
            content.body = "\(word.original) - \(word.translation)\n\(word.example)"
        }
        
        // Schedule notification for every day at 10 AM
        var dateComponents = DateComponents()
        dateComponents.hour = 10
        dateComponents.minute = 0
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
