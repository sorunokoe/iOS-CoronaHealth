//
//  NotificationService.swift
//  CoronaVirusHealth
//
//  Created by Yeskendir Salgara on 3/27/20.
//  Copyright © 2020 Yeskendir Salgara. All rights reserved.
//

import Foundation
import UserNotifications

class NotificationService{
    
    static var shared = NotificationService()
    
    func scheduleNotification(notificationType: String) {
        let content = UNMutableNotificationContent()
        content.title = notificationType
        content.body = "You're in dengerous place. Be carefull. Wear a mask. And don't touch your face."
        content.sound = .default
        content.badge = 1
        
    }
}
