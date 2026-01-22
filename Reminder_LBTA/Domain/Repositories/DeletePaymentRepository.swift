//
//  DeletePaymentRepository.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 22.01.2026.
//

import Foundation

protocol DeletePaymentRepository: AnyObject {
  func delete(payment: Payment) async throws
}
