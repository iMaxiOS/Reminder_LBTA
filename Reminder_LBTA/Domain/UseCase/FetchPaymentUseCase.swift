//
//  FetchPaymentUseCase.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 19.01.2026.
//

import Foundation

protocol FetchPaymentUseCase: AnyObject {
  func fetchPayments(date: Date?) async throws -> [Payment]
}

class FetchPaymentUseCaseImp: FetchPaymentUseCase {
  private let repository: FetchPaymentRepository
  
  init(repository: FetchPaymentRepository) {
    self.repository = repository
  }
  
  func fetchPayments(date: Date?) async throws -> [Payment] {
    try await repository.fetchPayments(date: date)
  }
}
