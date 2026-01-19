//
//  AddViewModel.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 17.01.2026.
//

import Foundation
import Combine

class AddViewModel: ObservableObject {
  private let createUseCase: CreatePaymentUseCase
  
  @Published var date: Date = Date.now
  @Published var isPaymentNotification: Bool = false
  @Published var isShowCalendar: Bool = false
  @Published var isAdded: Bool = false
  @Published var payType: PayType = .monthly
  @Published var paymentName: String = ""
  @Published var description: String = ""
  @Published var paymentAmount: String = ""
  @Published var totalAmount: String = ""
  
  init(createUseCase: CreatePaymentUseCase) {
    self.createUseCase = createUseCase
  }
  
  func createNewPayment() {
    do {
      try createUseCase.execute(payment: Payment(
        id: UUID().uuidString,
        title: paymentName,
        type: payType,
        descriptionText: description,
        totalAmount: Double(totalAmount) ?? 0,
        paymentAmount: Double(paymentAmount) ?? 0,
        dueDay: date.day,
        dueDate: date,
        isNotificationEnable: isPaymentNotification,
        createAt: .now,
        lastPay: nil
      ))
      
      isAdded.toggle()
    } catch {
      print(error.localizedDescription)
    }
  }
}
