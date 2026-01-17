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
  
  init(createUseCase: CreatePaymentUseCase) {
    self.createUseCase = createUseCase
  }
  
  func createNewPayment() {
    do {
      try createUseCase.execute(payment: Payment(
        id: UUID().uuidString,
        title: "Title", type: .monthly,
        descriptionText: "Description",
        totalAmount: 1000,
        paymentAmount: 100,
        isNotificationEnable: true,
        createAt: .now
      ))
    } catch {
      print(error.localizedDescription)
    }
  }
}
