//
//  CreatePaymentManager.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import CoreData

class CreatePaymentManager: CreatePaymentDataSource {
  
  let context: NSManagedObjectContext = PersistenceContainer.shared.persistentContainer.viewContext
  
  func createNewPayment(payment: Payment) throws {
    let _ = PaymentMapper.toEntity(from: payment, context: context)
    try context.save()
  }
}

private class PersistenceContainer {
  static let shared: PersistenceContainer = .init()
  
  private init() {}
  
  lazy var persistentContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "db")
    container.loadPersistentStores(completionHandler: { (storeDescription, error) in
      if let error = error as NSError? {
        fatalError("Unresolved error \(error), \(error.userInfo)")
      }
    })
    return container
  }()
}
