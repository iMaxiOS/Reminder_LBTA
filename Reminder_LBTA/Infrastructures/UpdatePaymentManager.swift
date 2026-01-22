//
//  UpdatePaymentManager.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 22.01.2026.
//

import Foundation
import CoreData

class UpdatePaymentManager: UpdatePaymentDataSource {

  let context = PersistenceContainer.shared.persistentContainer.viewContext
  
  func updateNotification(payment: Payment, notificationIsOn: Bool) async throws {
    if let currentPayment = try await search(paymentID: payment.id) {
      currentPayment.isNotificationEnable = notificationIsOn
      try context.save()
    } else {
      throw NSError(domain: "Error for search \(payment.id)", code: 0)
    }
  }
  
  func deleteLast(payment: Payment) async throws {
    if let currentPayment = try await search(paymentID: payment.id) {
      currentPayment.lastPay = Date().minus(days: 1)
      try context.save()
    } else {
      throw NSError(domain: "Error for search \(payment.id)", code: 0)
    }
  }
  
  func close(payment: Payment) async throws {
    if let currentPayment = try await search(paymentID: payment.id) {
      currentPayment.isClose = true 
      try context.save()
    } else {
      throw NSError(domain: "Error for search \(payment.id)", code: 0)
    }
  }
  
  private func search(paymentID: String) async throws -> PaymentEntity? {
    let request = PaymentEntity.fetchRequest()
    request.predicate = NSPredicate(format: "id == %@", paymentID)
    
    if let payment = try? context.fetch(request), let currentPayment = payment.first {
      return currentPayment
    }
    
    return nil
  }
  
}
