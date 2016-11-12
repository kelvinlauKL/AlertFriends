//
//  AppDelegate.swift
//  AlertFriends
//
//  Created by Kelvin Lau on 2016-11-12.
//  Copyright © 2016 Kelvin. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications

@UIApplicationMain
final class AppDelegate: UIResponder {
  var window: UIWindow?
  
  override init() {
    super.init()
    FIRApp.configure()
  }
}

// MARK: - UIApplicationDelegate
extension AppDelegate: UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    UNUserNotificationCenter.current().requestAuthorization(options: authOptions, completionHandler: { _, _ in })
    UNUserNotificationCenter.current().delegate = self

    return true
  }
  
  func tokenRefreshNotification(notification: Notification) {
    if let refreshedToken = FIRInstanceID.instanceID().token() {
      print("InstanceID token: \(refreshedToken)")
    }
    connectToFcm()
  }
  
  func connectToFcm() {
    FIRMessaging.messaging().connect { error in
      if let error = error {
        print("Unable to connect with FCM. \(error)")
      } else {
        print("Connected to FCM")
      }
    }
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    connectToFcm()
  }
  
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    FIRInstanceID.instanceID().setAPNSToken(deviceToken, type: .sandbox)
  }
  
  func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    FIRMessaging.messaging().appDidReceiveMessage(userInfo)
  }
}


// MARK: - UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    let userInfo = notification.request.content.userInfo
    print("Message ID: \(userInfo["gcm.message_id"]!)")
    print(userInfo)
    completionHandler([.alert, .sound])
  }
}
