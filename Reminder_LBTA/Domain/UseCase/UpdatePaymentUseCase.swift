//
//  UpdatePaymentUseCase.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 22.01.2026.
//

import Foundation

protocol UpdatePaymentUseCase: AnyObject {
  func updateNotification(payment: Payment, notificationIsOn: Bool) async throws
  func deleteLast(payment: Payment) async throws
  func close(payment: Payment) async throws
}

class UpdatePaymentUseCaseImp: UpdatePaymentUseCase {
  
  private let repository: UpdatePaymentRepository
  
  init(repository: UpdatePaymentRepository) {
    self.repository = repository
  }
  
  func updateNotification(payment: Payment, notificationIsOn: Bool) async throws {
    try await repository.updateNotification(payment: payment, notificationIsOn: notificationIsOn)
  }
  
  func deleteLast(payment: Payment) async throws {
    try await repository.deleteLast(payment: payment)
  }
  
  func close(payment: Payment) async throws {
     try await repository.close(payment: payment)
  }
}
