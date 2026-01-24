//
//  NotificationRepositoryImpl.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 24.01.2026.
//

import Foundation

class NotificationRepositoryImp: NotificationRepository {
  private let dataSource: NotificationDataSource
  
  init(dataSource: NotificationDataSource) {
    self.dataSource = dataSource
  }
  
  func createNotification(item: Notification) async throws {
    try await dataSource.createNotification(item: item)
  }
  
  func deleteNotification(id: String) async throws {
    try await dataSource.deleteNotification(id: id)
  }
}
