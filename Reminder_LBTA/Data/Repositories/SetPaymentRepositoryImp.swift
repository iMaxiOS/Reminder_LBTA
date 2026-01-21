//
//  SetPaymentRepositoryImp.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 21.01.2026.
//


import Foundation


class SetPaymentRepositoryImp: SetPaymentRepository {
  
  private let dataSource: SetPaymentDataSource
  
  init(dataSource: SetPaymentDataSource) {
    self.dataSource = dataSource
  }
  
  func set(payment: Payment) async throws {
    try await dataSource.set(payment: payment)
  }
}
