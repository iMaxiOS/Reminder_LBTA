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
    let fetchRequest = PaymentEntity.fetchRequest()
    
    if let date {
      let predicate = NSPredicate(format: "lastDay >= %@ AND lastDay < %@",
                                  date.startOfMonth as NSDate,
                                  date.endOfMonth as NSDate)
      fetchRequest.predicate = predicate
    }
    
    let payments = try context.fetch(fetchRequest)
    let domainPayments = payments.map { payment in
      PaymentMapper.toDomain(from: payment)
    }
    return domainPayments
  }
}
