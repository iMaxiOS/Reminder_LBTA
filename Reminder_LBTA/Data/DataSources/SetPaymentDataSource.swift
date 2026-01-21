//
//  SetPaymentDataSource.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 21.01.2026.
//

import Foundation

protocol SetPaymentDataSource: AnyObject {
  func set(payment: Payment) async throws
}
