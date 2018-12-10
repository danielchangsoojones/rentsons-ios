//
//  AppDelegate.swift
//  rentsons-ios
//
//  Created by Daniel Jones on 12/9/18.
//  Copyright © 2018 Chong500Productions. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Server().configure(from: launchOptions)
        application.registerForRemoteNotifications()
        setStartingVC()
        
        //TODO: I can remove this eventually, this is just to get the push notifications testing working
        let types: UIUserNotificationType = [.Alert, .Badge, .Sound]
        let settings = UIUserNotificationSettings(forTypes: types, categories: nil)
        application.registerUserNotificationSettings(settings)
        
        return true
    }
}

//MARK: push notifications
extension AppDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        InstallationParse.register(deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("application:didFailToRegisterForRemoteNotificationsWithError: %@", error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        PFPush.handle(userInfo)
    }
}

extension AppDelegate {
    var isNotLoggedIn: Bool {
        return User.current() == nil
    }
    
    private func setStartingVC() {
        if isNotLoggedIn {
            toWelcomeVC()
        } else {
            toHomeVC()
        }
    }
    
    private func toHomeVC() {
        let homeVC = UIViewController()
        setInitial(vc: homeVC)
    }
    
    private func toWelcomeVC() {
        let vc = UIViewController()
        setInitial(vc: vc)
    }
    
    private func setInitial(vc: UIViewController) {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
}

