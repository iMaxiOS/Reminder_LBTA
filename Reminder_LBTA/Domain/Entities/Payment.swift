//
//  Payment.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import Foundation

struct Payment: Identifiable, Hashable {
  var id: String
  var title: String
  var type: PayType
  var descriptionText: String
  var totalAmount: Double
  var paymentAmount: Double
  var dueDay: Int
  var dueDate: Date?
  var isNotificationEnable: Bool
  var createAt: Date
  var lastPay: Date?
}
