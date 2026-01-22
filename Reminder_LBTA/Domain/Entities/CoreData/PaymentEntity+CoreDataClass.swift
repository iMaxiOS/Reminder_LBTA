//
//  PaymentEntity+CoreDataClass.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 20.01.2026.
//
//

public import Foundation
public import CoreData

public typealias PaymentEntityCoreDataClassSet = NSSet

@objc(PaymentEntity)
public class PaymentEntity: NSManagedObject {

}


public typealias PaymentEntityCoreDataPropertiesSet = NSSet

extension PaymentEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PaymentEntity> {
        return NSFetchRequest<PaymentEntity>(entityName: "PaymentEntity")
    }

    @NSManaged public var createAt: Date
    @NSManaged public var descriptionText: String
    @NSManaged public var dueDate: Date?
    @NSManaged public var dueDay: Int16
    @NSManaged public var id: String
    @NSManaged public var isNotificationEnable: Bool
    @NSManaged public var lastPay: Date?
    @NSManaged public var paymentAmount: NSDecimalNumber
    @NSManaged public var remainingAmount: NSDecimalNumber
    @NSManaged public var title: String
    @NSManaged public var totalAmount: NSDecimalNumber
    @NSManaged public var type: Int16
    @NSManaged public var isClose: Bool
    @NSManaged public var closeDate: Date?

}

extension PaymentEntity : Identifiable {

}
