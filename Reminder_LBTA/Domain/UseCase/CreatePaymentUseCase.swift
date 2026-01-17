//
//  CreatePaymentUseCase.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import Foundation

protocol CreatePaymentUseCase: AnyObject {
  func execute(payment: Payment) throws
}

class CreatePaymentUseCaseImp: CreatePaymentUseCase {
  private let repository: CreatePaymentRepository
  
  init(repository: CreatePaymentRepository) {
    self.repository = repository
  }
  
  func execute(payment: Payment) throws {
    try repository.create(payment: payment)
  }
}
