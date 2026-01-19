//
//  FetchPaymentRepositoryImpl.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 19.01.2026.
//

import Foundation

class FetchPaymentRepositoryImp: FetchPaymentRepository {
  
  private let dataSource: FetchPaymentDataSource
  
  init(dataSource: FetchPaymentDataSource) {
    self.dataSource = dataSource
  }
  
  func fetchPayments(date: Date?) async throws -> [Payment] {
    try await dataSource.fetchPayments(date: date)
  }
}
