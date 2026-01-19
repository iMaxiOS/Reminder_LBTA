//
//  FetchPaymentRepository.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 19.01.2026.
//

import Foundation

protocol FetchPaymentRepository: AnyObject {
  func fetchPayments(date: Date?) async throws -> [Payment]
}
