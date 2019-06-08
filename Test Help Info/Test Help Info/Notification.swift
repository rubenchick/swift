//
//  Notification.swift
//  Test Help Info
//
//  Created by Anton Rubenchik on 05/06/2019.
//  Copyright © 2019 Anton Rubenchik. All rights reserved.
//
// new version
import Foundation
import UserNotifications

class Notifications: NSObject, UNUserNotificationCenterDelegate {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func notificationRequest() {
        let options: UNAuthorizationOptions = [.alert,.badge,.sound]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (autorization: Bool, error: Error? ) in
            if !autorization {
                print("App is unless because you did not allow notification")
            }
        }
    }
    
    func pushNotification(tasks countTasts: Int) {
        let notificationTime = DateComponents(second: 10)
        let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: notificationTime, repeats: false)
        
        let notificationContent = UNMutableNotificationContent()
        notificationContent.sound = UNNotificationSound.default
        notificationContent.body = "\(countTasts) tasks scheduled for today aren't done"
//        notificationContent.body = "4 задачи запланированные на сегодня ожидают выполнения"
        
        let notificationRequest = UNNotificationRequest(identifier: "secondNotification", content: notificationContent, trigger: notificationTrigger)
        
        notificationCenter.removeAllPendingNotificationRequests()
        notificationCenter.add(notificationRequest) { (error:Error?) in
            if let error = error {
                print("Error - \(error.localizedDescription)")
            }
        }
        
        
        
    }
   
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        switch response.actionIdentifier {
//        case "addDone":  removeAllNotification()
//        case "addRepeat":  print("add Repeat")
//        default:
//            return
//        }
        completionHandler()
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("Start. Will")
    }
   
    func removeAllNotification() {
        notificationCenter.removeAllPendingNotificationRequests()
    }
    
}
/*
 let notifications = Notifications() // new version
 
 func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
 
 notifications.notificationCenter.delegate = notifications  // new version
 notifications.notificationRequest() // new version
 */
