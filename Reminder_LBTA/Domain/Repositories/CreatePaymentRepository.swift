//
//  CreatePaymentRepository.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import Foundation

protocol CreatePaymentRepository: AnyObject {
  func create(payment: Payment) throws
}

