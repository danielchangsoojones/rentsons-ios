//
//  PushNotifications.swift
//  hoosier-riders
//
//  Created by Daniel Jones on 10/11/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import Foundation
import UserNotifications

class PushNotification {
    static func getPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            if granted {
                savePushNotificationEnabled(enabled: true)
            } else if let error = error {
                //for some reason, because we are on an SCLAlertView window
                //the letters don't show up on the BannerLoader, unless I add
                //a delay
                Timer.runThisAfterDelay(seconds: 0.5, after: {
                    BannerLoader.show(with: error)
                })
            } else {
                Timer.runThisAfterDelay(seconds: 0.5, after: {
                    BannerLoader.show(title: "Enable Notifications", subtitle: "Please go to your iPhone settings to manually enable push notifications")
                })
                savePushNotificationEnabled(enabled: false)
            }
        }
    }
    
    private static func savePushNotificationEnabled(enabled: Bool) {
        User.current()?.arePushNotificationsEnabled = enabled
        User.current()?.saveInBackground()
    }
}
