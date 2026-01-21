//
//  SetPaymentUseCase.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 21.01.2026.
//

import Foundation

protocol SetPaymentUseCase: AnyObject {
  func set(payment: Payment) async throws
}

class SetPaymentUseCaseImp: SetPaymentUseCase {
  
  private let repository: SetPaymentRepository
  
  init(repository: SetPaymentRepository) {
    self.repository = repository
  }
  
  func set(payment: Payment) async throws {
    try await repository.set(payment: payment)
  }
}
