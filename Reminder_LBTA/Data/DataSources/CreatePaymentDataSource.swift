//
//  CreatePaymentDataSource.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import Foundation

protocol CreatePaymentDataSource: AnyObject {
  func createNewPayment(payment: Payment) throws
}
