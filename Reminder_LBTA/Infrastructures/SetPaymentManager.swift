//
//  SetPaymentManager.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 21.01.2026.
//

import Foundation
import CoreData

class SetPaymentManager: SetPaymentDataSource {
  
  let context = PersistenceContainer.shared.persistentContainer.viewContext
  
  func set(payment: Payment) async throws {
    let request = PaymentEntity.fetchRequest()
    request.predicate = NSPredicate(format: "id == %@", payment.id)
    let payments = try context.fetch(request)
    
    if let contextPayment = payments.first {
      contextPayment.lastPay = .now
      
      if contextPayment.type == 0 {
        var remainingAmount = contextPayment.remainingAmount.decimalValue
        let paymentAmount = contextPayment.paymentAmount.decimalValue
        remainingAmount -= paymentAmount
        if remainingAmount <= 0 {
          closePaymentIsRemainingAmountZero(with: contextPayment)
        } else {
          contextPayment.remainingAmount = NSDecimalNumber(decimal: remainingAmount)
        }
      } else {
        closePaymentIsRemainingAmountZero(with: contextPayment)
      }
    }
    
    try context.save()
  }
  
  func closePaymentIsRemainingAmountZero(with contextPayment: PaymentEntity) {
    contextPayment.closeDate = .now
    contextPayment.isClose = true
    contextPayment.remainingAmount = .zero
    contextPayment.isNotificationEnable = false
  }
}
