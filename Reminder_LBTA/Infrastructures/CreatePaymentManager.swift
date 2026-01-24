//
//  CreatePaymentManager.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import CoreData
class CreatePaymentManager: CreatePaymentDataSource {
  
  let context = PersistenceContainer.shared.persistentContainer.viewContext
  
  func createNewPayment(payment: Payment) async throws {
    let _ = PaymentMapper.toEntity(from: payment, context: context)
    try context.save()
  }
}
