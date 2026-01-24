//
//  NotificationRepository.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 24.01.2026.
//

import Foundation

protocol NotificationRepository: AnyObject {
  func createNotification(item: Notification) async throws
  func deleteNotification(id: String) async throws
}
