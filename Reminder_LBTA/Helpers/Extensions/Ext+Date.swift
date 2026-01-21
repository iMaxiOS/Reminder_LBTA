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
  
  static let withoutDayMonthFormat: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale.current
    formatter.dateFormat = "MMMM YYYY"
    return formatter
  }()
  
  var dayMonthYear: String {
    Self.dayMonthFormat.string(from: self)
  }
  
  var withoutDayMonthYear: String {
    Self.withoutDayMonthFormat.string(from: self)
  }
  
  var day: Int {
    Calendar.current.component(.day, from: self)
  }
  
  var month: Int {
    Calendar.current.component(.month, from: self)
  }
  
  var startOfMonth: Date {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month], from: self)
    return calendar.date(from: components)!
  }
  
  var dateMonthString: String {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd.MM"
    return formatter.string(from: self)
  }
  
  var endOfMonth: Date {
    let calendar = Calendar.current
    return calendar.date(byAdding: .month, value: 1, to: startOfMonth)!
  }
  
  func isInSameMonth(date: Date) -> Bool {
    let calendar = Calendar.current
    return calendar.component(.month, from: self) == calendar.component(.month, from: date) &&
           calendar.component(.year, from: self) == calendar.component(.year, from: date)
  }
}
