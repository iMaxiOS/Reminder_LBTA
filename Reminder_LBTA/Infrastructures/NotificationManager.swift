//
//  NotificationManager.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 24.01.2026.
//


import Foundation
import UserNotifications

class NotificationManager: NotificationDataSource {
  
  private let center = UNUserNotificationCenter.current()
  
  private func checkPermission() async throws -> Bool {
    let settings = await center.notificationSettings()
    
    switch settings.authorizationStatus {
    case .authorized, .provisional, .ephemeral:
      return true
    case .denied:
      return false
    case .notDetermined:
      let granted = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<Bool, Error>) in
        center.requestAuthorization(options: [.alert, .badge, .sound, .criticalAlert]) { granted, error in
          if let error {
            continuation.resume(throwing: error)
          } else {
            continuation.resume(returning: granted)
          }
        }
      }
      return granted
    @unknown default:
      return false
    }
  }
  
  func createNotification(item: Notification) async throws {
    let granted = try await checkPermission()
    guard granted else { return }
    
    let content = UNMutableNotificationContent()
    
    switch item.payType {
    case .oneTime:
      content.title = "It's time to pay off the debt."
      content.body = "Reminder to pay debt before: \(item.date)"
    case .monthly:
      content.title = "Monthly payment."
      content.body = "Monthly payment reminder: \(item.amount), payment date: \(item.date)"
    }
    
    content.sound = .default
    
    var component = DateComponents()
    component.day = max(item.date.clampedDay(item.date.day) - 2, 1)
    component.hour = 11
    component.minute = 1
    
    let trigger = UNCalendarNotificationTrigger(dateMatching: component, repeats: item.payType == .monthly)
    let request = UNNotificationRequest(identifier: item.id, content: content, trigger: trigger)
    
    try await center.add(request)
  }
  
  func deleteNotification(id: String) async throws {
    center.removePendingNotificationRequests(withIdentifiers: [id])
    center.removeDeliveredNotifications(withIdentifiers: [id])
  }
}

