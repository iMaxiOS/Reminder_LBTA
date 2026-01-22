//
//  FetchPaymentManager.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 19.01.2026.
//

import Foundation
import CoreData

class FetchPaymentManager: FetchPaymentDataSource {
  
  let context = PersistenceContainer.shared.persistentContainer.viewContext
  
  func fetchPayments(date: Date?) async throws -> [Payment] {
    let request = PaymentEntity.fetchRequest()
    
    if let date {
      request.predicate = NSPredicate(
        format: "lastPay >= %@ AND lastPay < %@",
        date.startOfMonth as NSDate,
        date.endOfMonth as NSDate
      )
    } else {
      request.predicate = NSPredicate(format: "isClose == NO")
    }
    
    request.sortDescriptors = [NSSortDescriptor(key: "createAt", ascending: false)]
    let payments = try context.fetch(request)
    let domainPayments = payments.map { payment in
      PaymentMapper.toDomain(from: payment)
    }
    
    return domainPayments
  }
}
