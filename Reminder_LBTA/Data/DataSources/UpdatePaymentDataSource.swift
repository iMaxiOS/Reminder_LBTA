//
//  UpdatePaymentDataSource.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 22.01.2026.
//

import Foundation

protocol UpdatePaymentDataSource: AnyObject {
  func updateNotification(payment: Payment, notificationIsOn: Bool) async throws
  func deleteLast(payment: Payment) async throws
  func close(payment: Payment) async throws
}
