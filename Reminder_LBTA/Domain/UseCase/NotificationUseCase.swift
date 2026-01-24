//
//  NotificationUseCase.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 24.01.2026.
//

import Foundation

protocol NotificationUseCase: AnyObject {
  func createNotification(item: Notification) async throws
  func deleteNotification(id: String) async throws
}

class NotificationUseCaseImp: NotificationUseCase {
  private let repository: NotificationRepository
  
  init(repository: NotificationRepository) {
    self.repository = repository
  }
  
  func createNotification(item: Notification) async throws {
    try await repository.createNotification(item: item)
  }
  
  func deleteNotification(id: String) async throws {
    try await repository.deleteNotification(id: id)
  }
}
