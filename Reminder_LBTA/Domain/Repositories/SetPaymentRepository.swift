//
//  SetPaymentRepository.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 21.01.2026.
//

import Foundation

protocol SetPaymentRepository: AnyObject {
  func set(payment: Payment) async throws
}
