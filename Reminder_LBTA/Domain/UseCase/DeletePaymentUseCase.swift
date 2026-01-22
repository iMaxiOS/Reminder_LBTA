//
//  DeletePaymentUseCase.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 22.01.2026.
//

import Foundation

protocol DeletePaymentUseCase {
  func delete(payment: Payment) async throws
}

class DeletePaymentUseCaseImp: DeletePaymentUseCase {
  
  private let repository: DeletePaymentRepository
  
  init(repository: DeletePaymentRepository) {
    self.repository = repository
  }
  
  func delete(payment: Payment) async throws {
    try await repository.delete(payment: payment)
  }
}


