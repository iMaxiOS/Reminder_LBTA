//
//  UpdatePaymentRepositoryImp.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 22.01.2026.
//

import Foundation

class UpdatePaymentRepositoryImp: UpdatePaymentRepository {
  
  private let dataSource: UpdatePaymentDataSource
  
  init(dataSource: UpdatePaymentDataSource) {
    self.dataSource = dataSource
  }
  
  func updateNotification(payment: Payment, notificationIsOn: Bool) async throws {
    try await dataSource.updateNotification(payment: payment, notificationIsOn: notificationIsOn)
  }
  
  func deleteLast(payment: Payment) async throws {
    try await dataSource.deleteLast(payment: payment)
  }
  
  func close(payment: Payment) async throws {
    try await dataSource.close(payment: payment)
  }
}
