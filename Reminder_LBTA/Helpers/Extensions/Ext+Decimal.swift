//
//  Ext+Decimal.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 20.01.2026.
//

import Foundation

extension Decimal {
  var formatterWithoutDecimal: String {
    let formatter = NumberFormatter()
    formatter.locale = Locale(identifier: "en_US")
    formatter.numberStyle = .currency
    formatter.groupingSeparator = " "
    formatter.maximumFractionDigits = 0
    formatter.currencyCode = "USD"
    
    return formatter.string(from: self as NSNumber) ?? ""
  }
}
