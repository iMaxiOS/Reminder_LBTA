//
//  DeletePaymentDataSource.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 22.01.2026.
//

import Foundation

protocol DeletePaymentDataSource: AnyObject {
  func delete(payment: Payment) async throws
}
