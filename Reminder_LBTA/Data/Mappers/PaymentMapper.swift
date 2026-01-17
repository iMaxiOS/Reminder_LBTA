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
      id: entity.id ?? "",
      title: entity.title ?? "",
      type: ChangeState(rawValue: Int(entity.type)) ?? .monthly,
      descriptionText: entity.descriptionText ?? "",
      totalAmount: entity.totalAmount,
      paymentAmount: entity.paymentAmount,
      isNotificationEnable: entity.isNotificationEnable,
      createAt: entity.createAt ?? .now
    )
  }
  
  static func toEntity(from payment: Payment, context: NSManagedObjectContext) -> PaymentEntity {
    let entity = PaymentEntity(context: context)
    entity.id = payment.id
    entity.title = payment.title
    entity.type = Int16(payment.type.rawValue)
    entity.descriptionText = payment.descriptionText
    entity.totalAmount = payment.totalAmount
    entity.paymentAmount = payment.paymentAmount
    entity.isNotificationEnable = payment.isNotificationEnable
    entity.createAt = payment.createAt
    return entity
  }
}
