//
//  DeletePaymentManager.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 22.01.2026.
//

import Foundation
import CoreData

class DeletePaymentManager: DeletePaymentDataSource {
  
  let context = PersistenceContainer.shared.persistentContainer.viewContext
  
  func delete(payment: Payment) async throws {
    let request = PaymentEntity.fetchRequest()
    request.predicate = NSPredicate(format: "id == %@", payment.id)
    
    if let payments = try? context.fetch(request), let currentPayment = payments.first {
      context.delete(currentPayment)
      try context.save()
    }
//    let objects = try context.fetch(request)
//    guard !objects.isEmpty else { return }
//    
//    for object in objects {
//      context.delete(object)
//    }
//    
//    try context.save()
  }
}

