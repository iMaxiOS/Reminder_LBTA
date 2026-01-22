//
//  DeletePaymentRepositoryImp.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 22.01.2026.
//

import Foundation

class DeletePaymentRepositoryImp: DeletePaymentRepository {
  
  private let dataSource: DeletePaymentDataSource
  
  init(dataSource: DeletePaymentDataSource) {
    self.dataSource = dataSource
  }
  
  func delete(payment: Payment) async throws {
    try await dataSource.delete(payment: payment)
  }
}
