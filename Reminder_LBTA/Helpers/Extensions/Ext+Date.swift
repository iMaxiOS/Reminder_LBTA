//
//  Ext+Date.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 16.01.2026.
//

import Foundation

extension Date {
  static let dayMonthFormat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale.current
    formatter.dateFormat = "d MMMM YYYY"
    return formatter
  }()
  
  var dayMonthYear: String {
    Self.dayMonthFormat.string(from: self)
  }
  
  var day: Int {
    Calendar.current.component(.day, from: self)
  }
}
