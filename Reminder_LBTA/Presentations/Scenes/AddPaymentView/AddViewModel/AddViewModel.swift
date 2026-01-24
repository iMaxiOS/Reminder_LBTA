//
//  AddViewModel.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import Foundation
import Combine

@MainActor
class AddViewModel: ObservableObject {
  private let createUseCase: CreatePaymentUseCase
  private let notificationUseCase: NotificationUseCase
  
  @Published var date: Date = Date.now
  @Published var isPaymentNotification: Bool = false
  @Published var isShowCalendar: Bool = false
  @Published var isAdded: Bool = false
  @Published var payType: PayType = .monthly
  @Published var paymentName: String = ""
  @Published var description: String = ""
  @Published var paymentAmount: String = ""
  @Published var totalAmount: String = ""
  @Published var remainingAmount: String = ""
  
  init(createUseCase: CreatePaymentUseCase, notificationUseCase: NotificationUseCase) {
    self.createUseCase = createUseCase
    self.notificationUseCase = notificationUseCase
  }
  
  func createNewPayment() async {
    do {
      var lastPayDate: Date? = nil
      let paymentID = UUID().uuidString
      
      if payType == .monthly {
        lastPayDate = Date.now
      }
      
      if isPaymentNotification {
        try await addNotification(item: .init(id: paymentID, amount: paymentAmount, date: date, payType: payType))
      }
      
      try await createUseCase.execute(payment: Payment(
        id: paymentID,
        title: paymentName,
        type: payType,
        descriptionText: description,
        totalAmount: Decimal(string: totalAmount) ?? 0,
        paymentAmount: Decimal(string: paymentAmount) ?? 0,
        remainingAmount: Decimal(string: remainingAmount) ?? 0,
        dueDay: date.day,
        dueDate: date,
        isNotificationEnable: isPaymentNotification,
        createAt: .now,
        lastPay: lastPayDate,
        isClose: false,
        closeDate: .now
      ))
      
      isAdded.toggle()
    } catch {
      print(error.localizedDescription)
    }
  }
  
  private func addNotification(item: Notification) async throws {
    try await notificationUseCase.createNotification(item: item)
  }
}
