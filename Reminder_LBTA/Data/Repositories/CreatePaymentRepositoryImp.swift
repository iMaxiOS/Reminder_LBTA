//
//  CreatePaymentRepositoryImp.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import Foundation

class CreatePaymentRepositoryImp: CreatePaymentRepository {
  
  private let dataSource: CreatePaymentDataSource
  
  init(dataSource: CreatePaymentDataSource) {
    self.dataSource = dataSource
  }
  
  func create(payment: Payment) async throws {
    try await dataSource.createNewPayment(payment: payment)
  }
}
