//
//  DetailViewModel.swift
//  Reminder_LBTA
//
//  Created by Maxim Hranchenko on 21.01.2026.
//

import Foundation
import Combine

class PaymentDetailViewModel: ObservableObject {
  
  var payment: Payment
  private let updateUseCase: UpdatePaymentUseCase
  private let deleteUseCase: DeletePaymentUseCase
  private let notificationUseCase: NotificationUseCase
  
  init(payment: Payment, updateUseCase: UpdatePaymentUseCase, deleteUseCase: DeletePaymentUseCase, notificationUseCase: NotificationUseCase) {
    self.payment = payment
    self.updateUseCase = updateUseCase
    self.deleteUseCase = deleteUseCase
    self.notificationUseCase = notificationUseCase
  }
  
  func deletePayment() async {
    do {
      try await deleteUseCase.delete(payment: payment)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  func deleteLastPayment() async {
    do {
      try await updateUseCase.deleteLast(payment: payment)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  func updateNotification(_ notificationIsOn: Bool) async {
    do {
      try await updateUseCase.updateNotification(payment: payment, notificationIsOn: notificationIsOn)
      try await notificationUseCase.createNotification(item: .init(
        id: payment.id,
        amount: payment.remainingAmount.formatterWithoutDecimal,
        date: payment.dueDate ?? .now,
        payType: payment.type)
      )
    } catch {
      print(error.localizedDescription)
    }
  }
  
  func closePayment() async {
    do {
      try await updateUseCase.close(payment: payment)
    } catch {
      print(error.localizedDescription)
    }
  }
}
