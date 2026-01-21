//
//  PaymentMapper.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import Foundation
import CoreData

struct PaymentMapper {
  
  static func toDomain(from entity: PaymentEntity) -> Payment {
    return Payment(
      id: entity.id,
      title: entity.title,
      type: PayType(rawValue: Int(entity.type)) ?? .monthly,
      descriptionText: entity.descriptionText,
      totalAmount: entity.totalAmount as Decimal,
      paymentAmount: entity.paymentAmount as Decimal,
      remainingAmount: entity.remainingAmout as Decimal,
      dueDay: Int(entity.dueDay),
      dueDate: entity.dueDate,
      isNotificationEnable: entity.isNotificationEnable,
      createAt: entity.createAt,
      lastPay: entity.lastPay
    )
  }
  
  static func toEntity(from payment: Payment, context: NSManagedObjectContext) -> PaymentEntity {
    let entity = PaymentEntity(context: context)
    entity.id = payment.id
    entity.title = payment.title
    entity.type = Int16(payment.type.rawValue)
    entity.descriptionText = payment.descriptionText
    entity.totalAmount = payment.totalAmount as NSDecimalNumber
    entity.paymentAmount = payment.paymentAmount as NSDecimalNumber
    entity.remainingAmout = payment.remainingAmount as NSDecimalNumber
    entity.dueDay = Int16(payment.dueDay)
    entity.dueDate = payment.dueDate
    entity.isNotificationEnable = payment.isNotificationEnable
    entity.createAt = payment.createAt
    entity.lastPay = payment.lastPay
    return entity
  }
}
