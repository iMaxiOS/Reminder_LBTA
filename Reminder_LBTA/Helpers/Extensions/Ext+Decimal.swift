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
    formatter.numberStyle = .decimal
    formatter.groupingSeparator = " "
    formatter.maximumFractionDigits = 0
    
    return formatter.string(from: self as NSNumber) ?? ""
  }
}
